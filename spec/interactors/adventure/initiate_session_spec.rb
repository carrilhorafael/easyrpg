require 'rails_helper'

RSpec.describe Adventure::InitiateSession, type: :interactor do
  let(:master) { create(:player) }
  let(:adventure) { create(:adventure, gamemaster: master) }

  let(:session_params) { { title: "Derrotando um dragâo azul", description: "Uma aventura para derrotar um dragão azul" } }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if adventure has another session opened' do
        Adventure::InitiateSession.call!(adventure: adventure, session_params: session_params, performer: master)
        action = Adventure::InitiateSession.call(adventure: adventure, session_params: session_params, performer: master)

        expect(action).to be_failure
      end

      it 'fails if performer is not the gamemaster' do
        player = create(:player)
        action = Adventure::InitiateSession.call(adventure: adventure, session_params: session_params, performer: player)

        expect(action).to be_failure
      end

      it 'fails if params is invalid' do
        action = Adventure::InitiateSession.call(adventure: adventure, session_params: {}, performer: master)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it 'creates a new session to the adventure' do
        expect {
          Adventure::InitiateSession.call!(adventure: adventure, session_params: session_params, performer: master)
        }.to change(adventure.sessions, :count).by(1)
      end

      it 'creates a opened session' do
        action = Adventure::InitiateSession.call!(adventure: adventure, session_params: session_params, performer: master)

        expect(action.session.finished?).to be_falsey
      end

      it 'generates a activity log' do
        expect {
          Adventure::InitiateSession.call!(adventure: adventure, session_params: session_params, performer: master)
        }.to change { ActivityLog.where(activity: 'adventure::initiate_session').count }.by(1)
      end
    end
  end
end
