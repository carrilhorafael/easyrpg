class Race < ApplicationRecord
  belongs_to :creator, class_name: 'Player'
  has_many :heroes, dependent: :nullify

  validates :title, presence: true
  validates :normal_size, presence: true
end
