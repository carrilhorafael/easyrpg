class GameClass::Update < GameClass::Base

  def call
    check_params
    check_action_permission

    assign_attributes
    validate_model
    save_game_class
  end

  private

  def check_params
    context.fail!(errors: 'Game class params are missing') unless context.game_class_params
  end

  def check_action_permission
    context.fail!(errors: 'You are not allowed to update this game class') if game_class.default? || performer != game_class.creator
  end

  def assign_attributes
    context.game_class.assign_attributes(context.game_class_params)
  end

  def save_game_class
    game_class.save!
  end
end
