class Talent < ApplicationRecord
  belongs_to :creator, class_name: 'Player', optional: true

  validates :title, presence: true
  validates :features, presence: true

  scope :default, -> { where(creator: nil) }

  def default?
    creator.nil?
  end
end
