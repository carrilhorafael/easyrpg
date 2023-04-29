FactoryBot.define do
  factory :adventure do
    name { Faker::Lorem.word }
    data { { 'abilities' => [], 'skills' => [] } }
    association :gamemaster, factory: :player
  end
end
