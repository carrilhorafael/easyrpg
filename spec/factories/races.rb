FactoryBot.define do
  factory :race do
    creator { nil }
    title { ELF[:title] }
    source { ELF[:source] }
    only_subraces { ELF[:only_subraces] }
    normal_size { ELF[:normal_size] }
    caracteristics { ELF[:caracteristics] }
    abilities { ELF[:abilities] }
    speeds { ELF[:speeds] }
    features { ELF[:features] }
    languages { ELF[:languages] }
  end
end
