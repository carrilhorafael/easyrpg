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
    context.fail!(errors: 'Background params are missing') unless context.background_params
  end

  def check_action_permission
    context.fail!(errors: 'You are not allowed to update this background') if background.default? || performer != background.creator
  end

  def assign_attributes
    context.background.assign_attributes(context.background_params)
  end

  def background_params
    context.background_params
  end
end
