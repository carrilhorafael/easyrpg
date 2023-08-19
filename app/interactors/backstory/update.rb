class Backstory::Update < Backstory::Base

  def call
    check_params
    check_action_permission

    assign_attributes
    validate_model
    backstory.save!
  end

  private

  def check_params
    context.fail!(errors: 'Backstory params are missing') unless context.backstory_params
  end

  def check_action_permission
    context.fail!(errors: 'You are not allowed to update this backstory') if backstory.default? || performer != backstory.creator
  end

  def assign_attributes
    context.backstory.assign_attributes(context.backstory_params)
  end

  def backstory_params
    context.backstory_params
  end
end
