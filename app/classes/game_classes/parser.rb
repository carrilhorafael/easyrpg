class GameClasses::Parser
  class << self
    def parse(payload)
      GameClasses::Custom.new(
        title: payload[:title],
        description: payload[:description],
        source: payload[:source],
        abilities_hint: payload[:abilities_hint],
        hit_dice: payload[:hit_dice],
        proficiencies: payload[:proficiencies],
        multiclassing: payload[:multiclassing],
        initial_equipment: payload[:initial_equipment],
        spellcasting: payload[:spellcasting],
        features: payload[:features],
        subclasses: payload[:subclasses],
        invalid_adventures: payload[:invalid_adventures]
      )
    end
  end
end
