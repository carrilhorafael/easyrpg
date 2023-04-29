require 'rails_helper'

RSpec.describe Adventure::Update, type: :interactor do
  subject(:action) { Adventure::Update.call(adventure: adventure, adventure_params: adventure_params, performer: master) }
  let(:master) { create(:player) }
  let(:adventure) { create(:adventure, gamemaster: master) }
  let(:adventure_params) {
    {
      name: "First Adventure",
      abilities: ['Strengh', 'Dexterity', 'Constitution'],
    }
  }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if performer is not the gamemaster' do
        player = create(:player)
        action = Adventure::Update.call(adventure: adventure, adventure_params: adventure_params, performer: player)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it { expect { action }.to change { adventure.reload.name }.to('First Adventure') }
      it { expect { action }.to change { adventure.reload.abilities }.to(['Strengh', 'Dexterity', 'Constitution']) }

      it 'generates a activity log' do
        expect {
          action
        }.to change { ActivityLog.where(activity: 'adventure::update').count }.by(1)
      end
    end
  end
end
