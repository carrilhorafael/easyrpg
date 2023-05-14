class Adventure::Update < Adventure::Base
  after :generate_activity_log
  after :reload_resource

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

  def log_text
    I18n.t('activity_log.adventure.update', performer_name: performer.name, adventure_name: adventure.name)
  end
end
