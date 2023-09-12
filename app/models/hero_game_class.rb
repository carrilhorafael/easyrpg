class HeroGameClass < ApplicationRecord
  belongs_to :hero
  belongs_to :game_class
end
