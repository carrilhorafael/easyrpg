class RaceSerializer < ActiveModel::Serializer
  attributes :id, :only_subraces, :normal_size, :abilities, :speeds, :caracteristics, :features, :languages
  has_one :creator
end
