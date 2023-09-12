require 'rails_helper'

RSpec.describe Hero, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:adventure).optional }
    it { is_expected.to belong_to(:player) }
    it { is_expected.to belong_to(:race).optional }
    it { is_expected.to belong_to(:background).optional }
    it { is_expected.to have_many(:hero_game_classes).dependent(:destroy) }
    it { is_expected.to have_many(:game_classes).through(:hero_game_classes) }
    it { is_expected.to have_many(:hero_talents).dependent(:destroy) }
    it { is_expected.to have_many(:talents).through(:hero_talents) }
  end
end
