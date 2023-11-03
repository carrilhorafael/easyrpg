class GameClasses::Base
  attr_accessor :title, :description, :source, :abilities_hint, :hit_dice, :proficiencies, :multiclassing,
                :initial_equipment, :spellcasting, :features, :subclasses

  def format
    self.as_json
  end

  def invalid_adventures
    []
  end
end
