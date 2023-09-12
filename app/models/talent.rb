class Talent < ApplicationRecord
  belongs_to :creator, class_name: 'Player', optional: true
  has_many :hero_talents, dependent: :destroy
  has_many :heroes, through: :hero_talents

  validates :title, presence: true
  validates :features, presence: true

  scope :default, -> { where(creator: nil) }

  def default?
    creator.nil?
  end
end
