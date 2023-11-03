FactoryBot.define do
  factory :race do
    elf = Races::Templates::Elf.new

    association :creator, factory: :player
    title { elf.title }
    source { elf.source }
    only_subraces { elf.only_subraces }
    normal_size { elf.normal_size }
    caracteristics { elf.caracteristics }
    abilities { elf.abilities }
    speeds { elf.speeds }
    features { elf.features }
    languages { elf.languages }
  end
end
