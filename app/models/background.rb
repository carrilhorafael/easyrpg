class Background < ApplicationRecord
  belongs_to :creator, class_name: 'Player', optional: true

  validates :title, presence: true, uniqueness: { scope: :creator_id }

  scope :default, -> { where(creator_id: nil) }

  def default?
    !creator
  end
end
