class GameClass < ApplicationRecord
  belongs_to :creator, class_name: 'Player'
  has_many :hero_game_classes, dependent: :destroy
  has_many :heroes, through: :hero_game_classes

  validates :title, presence: true
  validates :description, presence: true
  validates :abilities_hint, presence: true
  validates :hit_dice, presence: true, format: { with: Dice::REGEX }
end
