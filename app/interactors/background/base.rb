class Background::Base < AbstractInteractor
  def resource
    race
  end

  def talent
    context.talent
  end

  def validate_model
    context.fail!(errors: background.errors) unless background.valid?
  end
end
