require 'rails_helper'

RSpec.describe GameClass::Create, type: :interactor do
  let(:performer) { create(:player) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = GameClass::Create.call(performer: performer)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new game class" do
        barbarian = GameClasses::Templates::Barbarian.new
        action = GameClass::Create.call(performer: performer, game_class_params: barbarian.as_json)

        expect(action).to be_success
        expect(action.game_class).to be_persisted
        expect(action.game_class).to be_persisted
        expect(action.game_class.title).to eq(barbarian.title)
        expect(action.game_class.creator).to eq(performer)
        expect(action.game_class.description).to eq(barbarian.description)
        expect(action.game_class.hit_dice).to eq(barbarian.hit_dice)
        expect(action.game_class.abilities_hint).to eq(barbarian.abilities_hint)
        expect(action.game_class.source).to eq(barbarian.source)
        expect(action.game_class.proficiencies.as_json).to eq(barbarian.proficiencies.as_json)
        expect(action.game_class.multiclassing.as_json).to eq(barbarian.multiclassing.as_json)
        expect(action.game_class.initial_equipment.as_json).to eq(barbarian.initial_equipment.as_json)
        expect(action.game_class.spellcasting.as_json).to eq(barbarian.spellcasting.as_json)
        expect(action.game_class.features.as_json).to eq(barbarian.features.as_json)
      end
    end
  end
end
