class Hero::Base < AbstractInteractor
  def resource
    hero
  end

  def hero
    context.hero
  end

  def player
    hero.player
  end

  private

  def validate_model
    context.fail!(errors: hero.errors) unless hero.valid?
  end
end
