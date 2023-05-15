class Race::Base < AbstractInteractor
  def resource
    race
  end

  def race
    context.race
  end

  def validate_model
    context.fail!(errors: race.errors) unless race.valid?
  end
end
