class Adventure::Update < Adventure::Base
  after :generate_activity_log

  def call
    check_action_permission
    assign_attributes
    validate_adventure
    adventure.save!
  end

  private

  def check_action_permission
    unless adventure.mastered_by? performer
      context.fail!(errors: {adventure: 'não pertence ao jogador'})
    end
  end

  def assign_attributes
    adventure.assign_attributes(adventure_params)
  end

  def adventure_params
    context.adventure_params
  end

  def generate_activity_log
    ActivityLog.log!(
      text: "#{performer.name} atualizou informações da aventura #{adventure.name}",
      performer: performer,
      adventure: adventure,
      activity: 'adventure::update'
    )
  end
end
