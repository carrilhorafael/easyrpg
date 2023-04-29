FactoryBot.define do
  factory :activity_log do
    association :performer, factory: :player

    adventure { association :adventure, gamemaster: performer }
    session { association :adventure_session, adventure: adventure }
    text { "#{performer.name} criou uma aventura #{adventure.name}" }

    extra { {} }
    activity { 'adventure::create' }
  end
end
