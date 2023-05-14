class GameClass::Create < GameClass::Base

  def call
    check_params

    build_game_class
    validate_model
    save_game_class
  end

  private

  def check_params
    context.fail!(errors: 'Game class params are missing') unless context.game_class_params
  end

  def build_game_class
    context.game_class = performer.game_classes.build(context.game_class_params)
  end

  def validate_model
    context.fail!(errors: context.game_class.errors) unless game_class.valid?
  end

  def save_game_class
    game_class.save!
  end
end
