require 'rails_helper'

RSpec.describe Race::Create, type: :interactor do
  let(:performer) { create(:player) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if race params is not passed' do
        action = Race::Create.call(performer: performer)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new race" do
        elf = Races::Templates::Elf.new
        action = Race::Create.call(performer: performer, race_params: elf.as_json)

        expect(action).to be_success
        expect(action.race).to be_persisted
        expect(action.race).to be_persisted
        expect(action.race.title).to eq(elf.title)
        expect(action.race.creator).to eq(performer)
        expect(action.race.source).to eq(elf.source)
        expect(action.race.abilities.as_json).to eq(elf.abilities.as_json)
        expect(action.race.only_subraces).to eq(elf.only_subraces)
        expect(action.race.normal_size).to eq(elf.normal_size)
        expect(action.race.caracteristics.as_json).to eq(elf.caracteristics.as_json)
        expect(action.race.speeds.as_json).to eq(elf.speeds.as_json)
        expect(action.race.features.as_json).to eq(elf.features.as_json)
        expect(action.race.abilities.as_json).to eq(elf.abilities.as_json)
      end
    end
  end
end
