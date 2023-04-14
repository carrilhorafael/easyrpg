FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "MinhaSenha1" }
  end
end
