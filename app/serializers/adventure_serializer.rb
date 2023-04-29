class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :name, :abilities, :skills

  has_one :gamemaster, serializer: PlayerSerializer
  has_many :sessions, serializer: AdventureSessionSerializer
end
