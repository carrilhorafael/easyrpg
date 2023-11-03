class Background::Update < Background::Base

  def call
    check_params
    check_action_permission

    assign_attributes
    validate_model
    background.save!
  end

  private

  def check_params
    context.fail!(errors: 'Background params are missing') unless background_params
  end

  def check_action_permission
    context.fail!(errors: 'You are not allowed to update this background') if performer != background.creator
  end

  def assign_attributes
    context.background.assign_attributes(background_params)
  end

  def background_params
    context.background_params.slice(:title, :source, :description, :proficiencies, :initial_equipment, :features)
  end
end
