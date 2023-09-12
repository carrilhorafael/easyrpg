class Player < ApplicationRecord
  has_secure_password

  has_many :mastered_adventures, class_name: 'Adventure', foreign_key: :gamemaster_id, dependent: :destroy
  has_many :game_classes, foreign_key: :creator_id, dependent: :destroy
  has_many :races, foreign_key: :creator_id, dependent: :destroy
  has_many :talents, foreign_key: :creator_id, dependent: :destroy
  has_many :backgrounds, foreign_key: :creator_id, dependent: :destroy
  has_many :heroes, foreign_key: :player_id, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  # validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/ }, if: :password
end
