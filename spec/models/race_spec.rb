require 'rails_helper'

RSpec.describe Race, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:normal_size) }
  end

  describe 'associations' do
    it { should belong_to(:creator).class_name('Player').optional }
  end

  describe 'scopes' do
    context 'default' do
      let!(:race) { create(:race) }
      let!(:user_race) { create(:race, creator: create(:player)) }

      it { expect(Race.default).to include(race) }
      it { expect(Race.default).not_to include(user_race) }
    end
  end
end
