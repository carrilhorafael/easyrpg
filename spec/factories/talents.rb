FactoryBot.define do
  factory :talent do
    actor = Feats::Templates::Actor.new
    title { actor.title }
    prerequisites { actor.prerequisites }
    features { actor.features }
    association :creator, factory: :player
  end
end
