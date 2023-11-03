require 'rails_helper'

RSpec.describe Hero::Update, type: :interactor do
  let(:performer) { create(:player) }
  let(:hero) { create(:hero, player: performer, name: "Volo") }

  describe '.call' do
    context 'cannot execute' do
    end

    context 'can execute' do
      let(:hero_params) { { name: 'Langris', personality_traits: { alignment: "Chaotic Neutral" }, body_traits: { height: 180, weight: 80 } } }
      it "updates hero's params" do
        action = Hero::Update.call(performer: performer, hero: hero, hero_params: hero_params)

        expect(action).to be_success
        expect(action.hero).to be_persisted
        expect(action.hero.name).to eq(hero_params[:name])
        expect(action.hero.personality_traits).to eq(hero_params[:personality_traits].as_json)
        expect(action.hero.body_traits).to eq(hero_params[:body_traits].as_json)
      end

      it "updates hero's game classes" do
        game_class = create(:game_class)
        action = Hero::Update.call(performer: performer, hero: hero, hero_params: hero_params.merge(game_class_ids: [game_class.id]))

        expect(action).to be_success
        expect(action.hero).to be_persisted
        expect(action.hero.game_classes).to include(game_class)
      end

      it "updates hero's talents" do
        talent = create(:talent)
        action = Hero::Update.call(performer: performer, hero: hero, hero_params: hero_params.merge(talent_ids: [talent.id]))

        expect(action).to be_success
        expect(action.hero).to be_persisted
        expect(action.hero.talents).to include(talent)
      end

      it "updates hero's background" do
        background = create(:background, creator: performer)
        action = Hero::Update.call(performer: performer, hero: hero, hero_params: hero_params.merge(background_id: background.id))

        expect(action).to be_success
        expect(action.hero).to be_persisted
        expect(action.hero.background).to eq(background)
      end

      it "updates hero's race" do
        race = create(:race)
        action = Hero::Update.call(performer: performer, hero: hero, hero_params: hero_params.merge(race_id: race.id))

        expect(action).to be_success
        expect(action.hero).to be_persisted
        expect(action.hero.race).to eq(race)
      end

      it "updates hero's adventure" do
        adventure = create(:adventure)
        action = Hero::Update.call(performer: performer, hero: hero, hero_params: hero_params.merge(adventure_id: adventure.id))

        expect(action).to be_success
        expect(action.hero).to be_persisted
        expect(action.hero.adventure).to eq(adventure)
      end
    end
  end
end
