class Adventure::Base < AbstractInteractor
  def resource
    adventure
  end

  def adventure
    context.adventure
  end

  def session
    context.session
  end

  def validate_adventure
    context.fail!(errors: adventure.errors) unless adventure.valid?
  end
end
