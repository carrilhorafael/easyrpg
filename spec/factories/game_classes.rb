require_relative '../../app/classes/templates/game_classes_constraints/barbarian.rb'

FactoryBot.define do
  factory :game_class do
    title { BARBARIAN[:title] }
    description { BARBARIAN[:description] }
    source { BARBARIAN[:source] }
    abilities_hint { BARBARIAN[:abilities_hint] }
    hit_dice { BARBARIAN[:hit_dice] }
    proficiencies { BARBARIAN[:proficiencies] }
    multiclassing { BARBARIAN[:multiclassing] }
    initial_equipment { BARBARIAN[:initial_equipment] }
    spellcasting { BARBARIAN[:spellcasting] }
    class_features { BARBARIAN[:class_features] }
    creator_id { nil }
  end
end
