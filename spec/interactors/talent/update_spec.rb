require 'rails_helper'

RSpec.describe Talent::Update, type: :interactor do
  let(:performer) { create(:player) }
  let(:talent) { create(:talent, creator: performer) }
  let(:actor_params) { Feats::Templates::Actor.new.as_json }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = Talent::Update.call(talent: talent, performer: performer)

        expect(action).to be_failure
      end

      it 'fails if performer is not the creator' do
        action = Talent::Update.call(talent: talent, performer: create(:player), talent_params: actor_params)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new feat" do
        action = Talent::Update.call(talent: talent, performer: performer, talent_params: actor_params)

        expect(action).to be_success
        expect(action.talent).to be_persisted
        expect(action.talent.title).to eq(actor_params["title"])
        expect(action.talent.creator).to eq(performer)
        expect(action.talent.prerequisites.as_json).to eq(actor_params["prerequisites"].as_json)
        expect(action.talent.features.as_json).to eq(actor_params["features"].as_json)
      end
    end
  end
end
