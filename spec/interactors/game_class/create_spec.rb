require 'rails_helper'
require_relative '../../../app/classes/templates/game_classes_constraints/barbarian.rb'

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
        action = GameClass::Create.call(performer: performer, game_class_params: BARBARIAN)

        expect(action).to be_success
        expect(action.game_class).to be_persisted
        expect(action.game_class).to be_persisted
        expect(action.game_class.title).to eq(BARBARIAN[:title])
        expect(action.game_class.creator).to eq(performer)
        expect(action.game_class.description).to eq(BARBARIAN[:description])
        expect(action.game_class.hit_dice).to eq(BARBARIAN[:hit_dice])
        expect(action.game_class.abilities_hint).to eq(BARBARIAN[:abilities_hint])
        expect(action.game_class.source).to eq(BARBARIAN[:source])
        expect(action.game_class.proficiencies.as_json).to eq(BARBARIAN[:proficiencies].as_json)
        expect(action.game_class.multiclassing.as_json).to eq(BARBARIAN[:multiclassing].as_json)
        expect(action.game_class.initial_equipment.as_json).to eq(BARBARIAN[:initial_equipment].as_json)
        expect(action.game_class.spellcasting.as_json).to eq(BARBARIAN[:spellcasting].as_json)
        expect(action.game_class.class_features.as_json).to eq(BARBARIAN[:class_features].as_json)
      end
    end
  end
end
