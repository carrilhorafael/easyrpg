class Talent::Base < AbstractInteractor
  def resource
    race
  end

  def talent
    context.talent
  end

  def validate_model
    context.fail!(errors: talent.errors) unless talent.valid?
  end
end
