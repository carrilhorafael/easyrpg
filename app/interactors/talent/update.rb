class Talent::Update < Talent::Base

  def call
    check_params
    check_action_permission

    assign_attributes
    validate_model
    talent.save!
  end

  private

  def check_params
    context.fail!(errors: 'Talent params are missing') unless context.talent_params
  end

  def check_action_permission
    context.fail!(errors: 'You are not allowed to update this talent') if performer != talent.creator
  end

  def assign_attributes
    context.talent.assign_attributes(context.talent_params)
  end

  def talent_params
    context.talent_params
  end
end
