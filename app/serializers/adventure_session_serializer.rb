class AdventureSessionSerializer < ActiveModel::Serializer
  attributes :id, :date, :title, :description, :time_played, :finished_at
  belongs_to :adventure
end
