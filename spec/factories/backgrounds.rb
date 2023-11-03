FactoryBot.define do
  factory :background do
    charlatan = Backgrounds::Templates::Charlatan.new
    association :creator, factory: :player
    title { charlatan.title }
    description { charlatan.description }
    proficiencies { charlatan.proficiencies }
    source { charlatan.source }
    initial_equipment { charlatan.initial_equipment }
    features { charlatan.features }
  end
end
