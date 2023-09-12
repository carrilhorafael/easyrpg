require 'rails_helper'

RSpec.describe Background, type: :model do
  describe 'associations' do
    it { binding.pry }
    it { should belong_to(:creator).class_name('Player').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:creator_id) }
  end

  describe 'scopes' do
    describe '.default' do
      it 'returns only default backgrounds' do
        default_background = create(:background, creator: nil)
        create(:background, creator: create(:player))

        expect(Background.default).to eq([default_background])
      end
    end
  end

  describe '#default?' do
    context 'when creator is nil' do
      it 'returns true' do
        background = build(:background, creator: nil)

        expect(background.default?).to eq(true)
      end
    end

    context 'when creator is not nil' do
      it 'returns false' do
        background = build(:background, creator: create(:player))

        expect(background.default?).to eq(false)
      end
    end
  end
end
