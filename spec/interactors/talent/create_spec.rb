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
        alert_params = Feats::Templates::Alert.new.as_json
        action = Talent::Create.call(performer: performer, talent_params: alert_params)

        expect(action).to be_success
        expect(action.talent).to be_persisted
        expect(action.talent.title).to eq(alert_params["title"])
        expect(action.talent.creator).to eq(performer)
        expect(action.talent.prerequisites.as_json).to eq(alert_params["prerequisites"].as_json)
        expect(action.talent.features.as_json).to eq(alert_params["features"].as_json)
      end
    end
  end
end
