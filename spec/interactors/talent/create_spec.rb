require 'rails_helper'

RSpec.describe Talent::Create, type: :interactor do
  let(:performer) { create(:player) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = Talent::Create.call(performer: performer)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new game class" do
        action = Talent::Create.call(performer: performer, talent_params: ALERT)

        expect(action).to be_success
        expect(action.talent).to be_persisted
        expect(action.talent.title).to eq(ALERT[:title])
        expect(action.talent.creator).to eq(performer)
        expect(action.talent.prerequisites.as_json).to eq(ALERT[:prerequisites].as_json)
        expect(action.talent.features.as_json).to eq(ALERT[:features].as_json)
      end
    end
  end
end
