class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :body_traits, :personality_traits
  has_one :adventure
  has_one :player
  has_one :race
  has_one :background
end
