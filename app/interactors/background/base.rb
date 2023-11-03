class Background::Base < AbstractInteractor
  def resource
    race
  end

  def background
    context.background
  end

  def validate_model
    context.fail!(errors: background.errors) unless background.valid?
  end
end
