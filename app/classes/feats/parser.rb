class Feats::Parser
  class << self
    def parse(payload)
      Feats::Custom.new(
        title: payload[:title],
        prerequisites: payload[:prerequisites],
        features: payload[:features],
        invalid_adventures: payload[:invalid_adventures]
      )
    end
  end
end
