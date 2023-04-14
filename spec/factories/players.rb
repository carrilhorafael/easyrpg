FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(min_length: 8, mix_case: true) }
  end
end
