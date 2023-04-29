require 'rails_helper'

RSpec.describe Adventure, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:gamemaster).class_name('Player') }
    it { is_expected.to have_many(:sessions).class_name('AdventureSession').dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:data) }
  end

  describe 'attributes' do
    it { is_expected.to have_attribute(:name) }
    it { is_expected.to have_attribute(:data) }
  end
end
