class Races::Templates::Dwarf < Races::Base
  def initialize
    @title = 'Dwarf'
    @source = 'Player\'s Handbook'
    @only_subraces = true
    @normal_size = 'medium'
    @caracteristics = {
      age: 'Dwarves mature at the same rate as humans, but they\'re considered young until they reach the age of 50. On average, they live about 350 years.',
      alignment: 'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.',
      size: 'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.',
    }
    @speeds = {
      walking: 25
    }
    @proficiencies = {
      languages: ['Common', 'Dwarvish']
    }
    @features = {}
  end
end
