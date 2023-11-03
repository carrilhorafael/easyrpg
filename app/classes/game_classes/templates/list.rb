class GameClasses::Templates::List
  def self.all
    [
      GameClasses::Templates::Barbarian.new,
      GameClasses::Templates::Bard.new,
      GameClasses::Templates::Cleric.new
    ]
  end
end
