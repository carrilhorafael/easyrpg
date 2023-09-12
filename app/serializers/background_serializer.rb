class BackgroundSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :proficiencies, :features
end
