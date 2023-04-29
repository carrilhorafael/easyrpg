class ActivityLog < ApplicationRecord
  belongs_to :performer, class_name: 'Player'
  belongs_to :adventure
  belongs_to :session, class_name: 'AdventureSession', optional: true

  validates :text, presence: true
  validates :activity, presence: true

  def self.log!(text:, activity:, performer:, adventure:, session:, extra:{})
    create!(
      performer: performer,
      activity: activity,
      extra: extra,
      text: text,
      adventure: adventure,
      session: session
    )
  end
end
