class GameClass < ApplicationRecord
  belongs_to :creator, class_name: 'Player', optional: true

  validates :title, presence: true
  validates :description, presence: true
  validates :abilities_hint, presence: true
  validates :hit_dice, presence: true, format: { with: Dice::REGEX }

  scope :default, -> { where(creator: nil) }

  def default?
    !creator
  end
end
