require 'rails_helper'

RSpec.describe Adventure::FinishSession, type: :interactor do
  let(:master) { create(:player) }
  let(:adventure) { create(:adventure, gamemaster: master) }
  let(:session) { create(:adventure_session, adventure: adventure) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if session is already finished' do
        session.update(finished_at: Time.zone.now)

        action = Adventure::FinishSession.call(adventure: adventure, session: session)

        expect(action).to be_failure
      end

      it 'fails if performer is not the gamemaster' do
        player = create(:player)
        action = Adventure::FinishSession.call(adventure: adventure, session: session, performer: player)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it 'finishes the session' do
        expect {
          Adventure::FinishSession.call!(adventure: adventure, session: session, performer: master)
        }.to change(session, :finished?).from(false).to(true)
      end
    end
  end
end
