class Hero < ApplicationRecord
  belongs_to :adventure, optional: true
  belongs_to :player
  belongs_to :race, optional: true
  belongs_to :background, optional: true

  has_many :hero_game_classes, dependent: :destroy
  has_many :game_classes, through: :hero_game_classes
  has_many :hero_talents, dependent: :destroy
  has_many :talents, through: :hero_talents
end
