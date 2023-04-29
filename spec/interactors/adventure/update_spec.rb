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
    it { expect { action }.to change { adventure.reload.name }.to('First Adventure') }
    it { expect { action }.to change { adventure.reload.abilities }.to(['Strengh', 'Dexterity', 'Constitution']) }
  end
end
