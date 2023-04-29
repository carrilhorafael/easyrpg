class Adventure < ApplicationRecord
  belongs_to :gamemaster, class_name: 'Player'
  has_many :sessions, class_name: 'AdventureSession', dependent: :destroy

  validates :name, presence: true
  validates :data, presence: true

  def abilities=(value)
    data['abilities'] = value
  end

  def abilities
    data['abilities']
  end

  def skills=(value)
    data['skills'] = value
  end

  def skills
    data['skills']
  end

  def mastered_by?(player)
    gamemaster == player
  end
end
