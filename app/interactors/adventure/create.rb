class Adventure::Create < Adventure::Base
  after :generate_activity_log

  def call
    build_adventure
    validate_adventure
    adventure.save!
  end

  private

  def build_adventure
    context.adventure = performer.mastered_adventures.build(adventure_params)
  end

  def adventure_params
    context.adventure_params
  end

  def generate_activity_log
    ActivityLog.log!(
      text: "#{performer.name} criou a aventura #{adventure.name}",
      performer: performer,
      adventure: adventure,
      activity: 'adventure::create'
    )
  end
end
