FactoryBot.define do
  factory :hero do
    name { Faker::Name.name }
    body_traits { {} }
    personality_traits { {} }
    association :adventure
    association :player
    association :race
    association :background
  end
end
