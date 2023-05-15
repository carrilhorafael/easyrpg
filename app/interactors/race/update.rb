class Race::Update < Race::Base

  def call
    check_params
    check_action_permission

    assign_attributes
    validate_model
    race.save!
  end

  private

  def check_params
    context.fail!(errors: 'Race params are missing') unless context.race_params
  end

  def check_action_permission
    context.fail!(errors: 'You are not allowed to update this race') if race.default? || performer != race.creator
  end

  def assign_attributes
    context.race.assign_attributes(context.race_params)
  end
end
