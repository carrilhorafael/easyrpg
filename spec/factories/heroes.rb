FactoryBot.define do
  factory :hero do
    name { Faker::Name.name }
    body_traits { {} }
    personality_traits { {} }
    association :player
  end
end
