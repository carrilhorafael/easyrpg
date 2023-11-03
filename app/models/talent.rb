class Talent < ApplicationRecord
  belongs_to :creator, class_name: 'Player'
  has_many :hero_talents, dependent: :destroy
  has_many :heroes, through: :hero_talents

  validates :title, presence: true
  validates :features, presence: true
end
