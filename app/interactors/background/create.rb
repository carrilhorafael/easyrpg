class Background::Create < Background::Base

  def call
    check_params
    build_background
    validate_model
    background.save!
  end

  private

  def check_params
    context.fail!(errors: 'Background params are missing') unless context.background_params
  end

  def build_background
    context.background = performer.backgrounds.build(background_params)
  end

  def background_params
    context.background_params.slice(:title, :source, :description, :proficiencies, :initial_equipment, :features)
  end
end
