FactoryBot.define do
  factory :background do
    title { CHARLATAN[:title] }
    description { CHARLATAN[:description] }
    proficiencies { CHARLATAN[:proficiencies] }
    source { CHARLATAN[:source] }
    initial_equipment { CHARLATAN[:initial_equipment] }
    features { CHARLATAN[:features] }
  end
end
