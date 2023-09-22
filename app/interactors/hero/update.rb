class Hero::Update < Hero::Base

  def call
    check_params
    check_permissions
    assign_attributes
    validate_model
    hero.save!
  end

  private

  def check_params
    context.fail!(errors: "Hero params are missing") unless hero_params
  end

  def check_permissions
    context.fail!(errors: "Performer cannot do this action") unless hero.can?(performer, action: :update)
  end

  def assign_attributes
    hero.assign_attributes(hero_params)
  end

  def hero_params
    context.hero_params || {}
  end
end
