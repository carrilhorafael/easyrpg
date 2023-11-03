class BackgroundSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :proficiencies, :features, :invalid_adventures, :initial_equipment, :source
end
