require 'rails_helper'

RSpec.describe Race, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:normal_size) }
  end

  describe 'associations' do
    it { should belong_to(:creator).class_name('Player') }
  end

end
