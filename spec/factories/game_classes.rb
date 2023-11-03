FactoryBot.define do
  factory :game_class do
    barbarian = GameClasses::Templates::Barbarian.new
    association :creator, factory: :player
    title { barbarian.title }
    description { barbarian.description }
    source { barbarian.source }
    abilities_hint { barbarian.abilities_hint }
    hit_dice { barbarian.hit_dice }
    proficiencies { barbarian.proficiencies }
    multiclassing { barbarian.multiclassing }
    initial_equipment { barbarian.initial_equipment }
    spellcasting { barbarian.spellcasting }
    features { barbarian.features }
    subclasses { barbarian.subclasses }
  end
end
