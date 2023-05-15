class GameClass::Create < GameClass::Base

  def call
    check_params

    build_game_class
    validate_model
    game_class.save!
  end

  private

  def check_params
    context.fail!(errors: 'Game class params are missing') unless context.game_class_params
  end

  def build_game_class
    context.game_class = performer.game_classes.build(context.game_class_params)
  end
end
