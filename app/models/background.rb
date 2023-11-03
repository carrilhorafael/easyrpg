class Background < ApplicationRecord
  belongs_to :creator, class_name: 'Player'

  validates :title, presence: true, uniqueness: { scope: :creator_id }
end
