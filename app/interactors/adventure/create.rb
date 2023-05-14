class Adventure::Create < Adventure::Base
  after :generate_activity_log
  after :reload_resource

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

  def log_text
    I18n.t('activity_log.adventure.create', performer_name: performer.name, adventure_name: adventure.name)
  end
end
