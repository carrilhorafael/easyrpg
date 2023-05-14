require 'rails_helper'
require_relative '../../../app/classes/templates/game_classes_constraints/bard.rb'
require_relative '../../../app/classes/templates/game_classes_constraints/barbarian.rb'

RSpec.describe GameClass::Update, type: :interactor do
  let(:performer) { create(:player) }
  let(:game_class) { create(:game_class, creator: performer, **BARBARIAN) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = GameClass::Update.call(game_class: game_class, performer: performer)

        expect(action).to be_failure
      end

      it 'fails if performer is not the creator' do
        action = GameClass::Update.call(game_class: game_class, performer: create(:player), game_class_params: BARD)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new game class" do
        action = GameClass::Update.call(game_class: game_class, performer: performer, game_class_params: BARD)

        expect(action).to be_success
        expect(action.game_class).to be_persisted
        expect(action.game_class.title).to eq(BARD[:title])
        expect(action.game_class.description).to eq(BARD[:description])
        expect(action.game_class.hit_dice).to eq(BARD[:hit_dice])
        expect(action.game_class.abilities_hint).to eq(BARD[:abilities_hint])
        expect(action.game_class.source).to eq(BARD[:source])
        expect(action.game_class.proficiencies.as_json).to eq(BARD[:proficiencies].as_json)
        expect(action.game_class.multiclassing.as_json).to eq(BARD[:multiclassing].as_json)
        expect(action.game_class.initial_equipment.as_json).to eq(BARD[:initial_equipment].as_json)
        expect(action.game_class.spellcasting.as_json).to eq(BARD[:spellcasting].as_json)
        expect(action.game_class.features.as_json).to eq(BARD[:features].as_json)
      end
    end
  end
end
