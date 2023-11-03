class GameClasses::Custom < GameClasses::Base
  def initialize(
      title:,
      description:,
      source:,
      abilities_hint:,
      hit_dice:,
      proficiencies:,
      multiclassing:,
      initial_equipment:,
      spellcasting:,
      features:,
      subclasses:,
      invalid_adventures:
    )
    @title = title
    @description = description
    @source = source
    @abilities_hint = abilities_hint
    @hit_dice = hit_dice
    @proficiencies = proficiencies
    @multiclassing = multiclassing
    @initial_equipment = initial_equipment
    @spellcasting = spellcasting
    @features = features
    @subclasses = subclasses
    @invalid_adventures = invalid_adventures || []
  end

  def invalid_adventures
    @invalid_adventures
  end
end
