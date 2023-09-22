class Hero::Create < Hero::Base

  def call
    check_params
    build_hero
    validate_model
    hero.save!
  end

  private

  def check_params
    context.fail!(errors: 'Hero params are missing') unless hero_params
    context.fail!(errors: 'Performer is missing') unless performer
  end

  def build_hero
    context.hero = performer.heroes.build(hero_params)
  end

  def hero_params
    context.hero_params || {}
  end
end
