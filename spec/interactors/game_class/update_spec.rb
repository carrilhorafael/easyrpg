require 'rails_helper'

RSpec.describe GameClass::Update, type: :interactor do
  let(:performer) { create(:player) }
  let(:game_class) { create(:game_class, creator: performer) }
  let(:bard_params) { GameClasses::Templates::Bard.new.as_json }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = GameClass::Update.call(game_class: game_class, performer: performer)

        expect(action).to be_failure
      end

      it 'fails if performer is not the creator' do
        action = GameClass::Update.call(game_class: game_class, performer: create(:player), game_class_params: bard_params)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new game class" do
        action = GameClass::Update.call(game_class: game_class, performer: performer, game_class_params: bard_params)

        expect(action).to be_success
        expect(action.game_class).to be_persisted
        expect(action.game_class.title).to eq(bard_params["title"])
        expect(action.game_class.description).to eq(bard_params["description"])
        expect(action.game_class.hit_dice).to eq(bard_params["hit_dice"])
        expect(action.game_class.abilities_hint).to eq(bard_params["abilities_hint"])
        expect(action.game_class.source).to eq(bard_params["source"])
        expect(action.game_class.proficiencies.as_json).to eq(bard_params["proficiencies"].as_json)
        expect(action.game_class.multiclassing.as_json).to eq(bard_params["multiclassing"].as_json)
        expect(action.game_class.initial_equipment.as_json).to eq(bard_params["initial_equipment"].as_json)
        expect(action.game_class.spellcasting.as_json).to eq(bard_params["spellcasting"].as_json)
        expect(action.game_class.features.as_json).to eq(bard_params["features"].as_json)
      end
    end
  end
end
