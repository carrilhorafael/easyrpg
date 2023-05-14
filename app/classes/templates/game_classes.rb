require_relative './game_classes_constraints/barbarian'
require_relative './game_classes_constraints/bard'
require_relative './game_classes_constraints/cleric'
module Templates
  class GameClasses

    def self.all
      [
        BARBARIAN,
        BARD,
        CLERIC
      ]
    end
  end
end
