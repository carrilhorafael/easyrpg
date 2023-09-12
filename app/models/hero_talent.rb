class HeroTalent < ApplicationRecord
  belongs_to :hero
  belongs_to :talent
end
