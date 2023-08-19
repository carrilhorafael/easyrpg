require 'rails_helper'

RSpec.describe Backstory, type: :model do
  describe 'associations' do
    it { should belong_to(:creator).class_name('Player').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:creator_id) }
  end

  describe 'scopes' do
    describe '.default' do
      it 'returns only default backstories' do
        default_backstory = create(:backstory, creator: nil)
        create(:backstory, creator: create(:player))

        expect(Backstory.default).to eq([default_backstory])
      end
    end
  end

  describe '#default?' do
    context 'when creator is nil' do
      it 'returns true' do
        backstory = build(:backstory, creator: nil)

        expect(backstory.default?).to eq(true)
      end
    end

    context 'when creator is not nil' do
      it 'returns false' do
        backstory = build(:backstory, creator: create(:player))

        expect(backstory.default?).to eq(false)
      end
    end
  end
end
