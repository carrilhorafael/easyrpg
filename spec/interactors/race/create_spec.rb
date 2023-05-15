require 'rails_helper'

RSpec.describe Race::Create, type: :interactor do
  let(:performer) { create(:player) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = Race::Create.call(performer: performer)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new game class" do
        action = Race::Create.call(performer: performer, race_params: ELF)

        expect(action).to be_success
        expect(action.race).to be_persisted
        expect(action.race).to be_persisted
        expect(action.race.title).to eq(ELF[:title])
        expect(action.race.creator).to eq(performer)
        expect(action.race.source).to eq(ELF[:source])
        expect(action.race.abilities.as_json).to eq(ELF[:abilities].as_json)
        expect(action.race.only_subraces).to eq(ELF[:only_subraces])
        expect(action.race.normal_size).to eq(ELF[:normal_size])
        expect(action.race.caracteristics.as_json).to eq(ELF[:caracteristics].as_json)
        expect(action.race.speeds.as_json).to eq(ELF[:speeds].as_json)
        expect(action.race.features.as_json).to eq(ELF[:features].as_json)
        expect(action.race.abilities.as_json).to eq(ELF[:abilities].as_json)
      end
    end
  end
end
