require 'rails_helper'

RSpec.describe Race::Update, type: :interactor do
  let(:performer) { create(:player) }
  let(:race) { create(:race, creator: performer) }
  let(:dwarf) { Races::Templates::Dwarf.new.as_json }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = Race::Update.call(race: race, performer: performer)

        expect(action).to be_failure
      end

      it 'fails if performer not allowed' do
        action = Race::Update.call(race: race, performer: create(:player), race_params: dwarf)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "updates a new game class" do
        action = Race::Update.call(race: race, performer: performer, race_params: dwarf)

        expect(action).to be_success
        expect(action.race).to be_persisted
        expect(action.race).to be_persisted
        expect(action.race.title).to eq(dwarf["title"])
        expect(action.race.creator).to eq(performer)
        expect(action.race.source).to eq(dwarf["source"])
        expect(action.race.only_subraces).to eq(dwarf["only_subraces"])
        expect(action.race.normal_size).to eq(dwarf["normal_size"])
        expect(action.race.caracteristics.as_json).to eq(dwarf["caracteristics"].as_json)
        expect(action.race.speeds.as_json).to eq(dwarf["speeds"].as_json)
        expect(action.race.features.as_json).to eq(dwarf["features"].as_json)
        expect(action.race.abilities.as_json).to eq(dwarf["abilities"].as_json)
      end
    end
  end
end
