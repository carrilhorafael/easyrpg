class Race < ApplicationRecord
  belongs_to :creator, class_name: 'Player', optional: true

  validates :title, presence: true
  validates :normal_size, presence: true

  scope :default, -> { where(creator: nil) }

  def default?
    !creator
  end
end
