require 'rails_helper'

RSpec.describe Background, type: :model do
  describe 'associations' do
    it { should belong_to(:creator).class_name('Player') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:creator_id) }
  end
end
