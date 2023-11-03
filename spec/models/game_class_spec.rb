require 'rails_helper'

RSpec.describe GameClass, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:creator).class_name('Player') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:abilities_hint) }
    it { is_expected.to validate_presence_of(:hit_dice) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to allow_value('1d6').for(:hit_dice) }
    it { is_expected.not_to allow_value('Teste').for(:hit_dice) }
  end
end
