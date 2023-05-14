class AdventureSession < ApplicationRecord
  belongs_to :adventure

  validates :date, presence: true
  validates :title, presence: true

  def finished?
    finished_at.present?
  end

  def time_played
    if finished?
      finished_at - created_at
    else
      Time.current - created_at
    end
  end

  def uid
    adventure.sessions.order(:created_at).pluck(:id).index(id) + 1
  end
end
