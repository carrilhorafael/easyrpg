class TalentSerializer < ActiveModel::Serializer
  attributes :id, :title, :prerequisites, :features
  belongs_to :creator
end
