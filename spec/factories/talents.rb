FactoryBot.define do
  factory :talent do
    title { ACTOR[:title] }
    prerequisites { ACTOR[:prerequisites] }
    features { ACTOR[:features] }
    creator { nil }
  end
end
