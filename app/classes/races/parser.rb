class Races::Parser
  class << self
    def parse(payload)
      Races::Custom.new(
        title: payload[:title],
        description: payload[:description],
        source: payload[:source],
        proficiencies: payload[:proficiencies],
        initial_equipment: payload[:initial_equipment],
        features: payload[:features],
        invalid_adventures: payload[:invalid_adventures]
      )
    end
  end
end
