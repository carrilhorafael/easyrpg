class Player < ApplicationRecord
  has_secure_password

  has_many :mastered_adventures, class_name: 'Adventure', foreign_key: :gamemaster_id

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/ }, if: :password
end
