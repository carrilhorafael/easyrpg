class Races::Parser
  class << self
    def parse(payload)
      Races::Custom.new(
        title: payload[:title],
        source: payload[:source],
        only_subraces: payload[:only_subraces],
        normal_size: payload[:normal_size],
        caracteristics: payload[:caracteristics],
        abilities: payload[:abilities],
        speeds: payload[:speeds],
        proficiencies: { languages: payload[:languages][:starting_proficiencies] },
        features: payload[:features],
        invalid_adventures: payload[:invalid_adventures]
      )
    end
  end
end
