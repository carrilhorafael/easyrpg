class GameClassSerializer < ActiveModel::Serializer
  attributes :id, :source, :title, :description, :abilities_hint, :hit_dice, :proficiencies, :multiclassing, :initial_equipment, :spellcasting, :features
  has_one :creator
end
