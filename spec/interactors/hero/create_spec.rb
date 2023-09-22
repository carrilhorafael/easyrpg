require 'rails_helper'

RSpec.describe Hero::Create, type: :interactor do
  let(:performer) { create(:player) }

  describe '.call' do
    context 'cannot execute' do
      it 'fails if hero params is not passed' do
        action = Hero::Create.call(performer: performer)

        expect(action).to be_failure
      end

      it 'fails if performer is not passed' do
        action = Hero::Create.call(hero_params: { name: 'Hero' })

        expect(action).to be_failure
      end
    end

    context 'can execute' do
      it "creates a new hero" do
        action = Hero::Create.call(performer: performer, hero_params: { name: 'Hero' })

        expect(action).to be_success
        expect(action.hero).to be_persisted
        expect(action.hero.name).to eq('Hero')
        expect(action.hero.player).to eq(performer)
      end
    end
  end
end

