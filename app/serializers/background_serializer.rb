class BackgroundSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :proficiencies, :features, :initial_equipment, :source
end
