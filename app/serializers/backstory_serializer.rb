class BackstorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :proficiencies, :features
end
