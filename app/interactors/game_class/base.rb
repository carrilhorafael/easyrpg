class GameClass::Base < AbstractInteractor
  def resource
    game_class
  end

  def game_class
    context.game_class
  end

  def validate_model
    context.fail!(errors: context.game_class.errors) unless game_class.valid?
  end
end
