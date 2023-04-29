class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :name, :data
  has_one :gamemaster, serializer: PlayerSerializer
end
