class Feats::Templates::List
  def self.all
    [
      Feats::Templates::Alert.new,
      Feats::Templates::Actor.new,
    ]
  end
end
