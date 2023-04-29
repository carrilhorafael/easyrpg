require 'rails_helper'

RSpec.describe Adventure::UpdateSession, type: :interactor do
  let(:master) { create(:player) }
  let(:adventure) { create(:adventure, gamemaster: master) }
  let(:session) { create(:adventure_session, adventure: adventure) }

  let(:session_params) { { title: "Derrotando um dragâo azul", description: "Uma aventura para derrotar um dragão azul" } }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if performer is not the gamemaster' do
        player = create(:player)
        action = Adventure::UpdateSession.call(adventure: adventure, session: session, session_params: session_params, performer: player)

        expect(action).to be_failure
      end

      it 'fails if params is invalid' do
        action = Adventure::UpdateSession.call(adventure: adventure, session: session, session_params: { title: nil }, performer: master)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it 'updates the session' do
        expect {
          Adventure::UpdateSession.call!(adventure: adventure, session: session, session_params: session_params, performer: master)
        }.to change(session, :title).to(session_params[:title])
      end

      it 'generates a activity log' do
        expect {
          Adventure::UpdateSession.call!(adventure: adventure, session: session, session_params: session_params, performer: master)
        }.to change { ActivityLog.where(activity: 'adventure::update_session').count }.by(1)
      end
    end
  end
end
