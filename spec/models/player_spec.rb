require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'associations' do
    it { should have_many(:mastered_adventures).class_name('Adventure').with_foreign_key('gamemaster_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password).is_at_least(8) }
    it { should allow_value('Password1').for(:password) }
    it { should_not allow_value('password').for(:password) }
    it { should_not allow_value('PASSWORD').for(:password) }
    it { should_not allow_value('password1').for(:password) }
    it { should_not allow_value('PASSWORD1').for(:password) }
  end
end
