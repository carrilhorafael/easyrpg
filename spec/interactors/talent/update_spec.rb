require 'rails_helper'

RSpec.describe Talent::Update, type: :interactor do
  let(:performer) { create(:player) }
  let(:talent) { create(:talent, creator: performer) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if class params is not passed' do
        action = Talent::Update.call(talent: talent, performer: performer)

        expect(action).to be_failure
      end

      it 'fails if performer is not the creator' do
        action = Talent::Update.call(talent: talent, performer: create(:player), talent_params: ACTOR)

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new game class" do
        action = Talent::Update.call(talent: talent, performer: performer, talent_params: ACTOR)

        expect(action).to be_success
        expect(action.talent).to be_persisted
        expect(action.talent.title).to eq(ACTOR[:title])
        expect(action.talent.creator).to eq(performer)
        expect(action.talent.prerequisites.as_json).to eq(ACTOR[:prerequisites].as_json)
        expect(action.talent.features.as_json).to eq(ACTOR[:features].as_json)
      end
    end
  end
end
