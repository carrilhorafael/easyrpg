class Backstory::Base < AbstractInteractor
  def resource
    race
  end

  def talent
    context.talent
  end

  def validate_model
    context.fail!(errors: backstory.errors) unless backstory.valid?
  end
end
