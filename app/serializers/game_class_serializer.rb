class GameClassSerializer < ActiveModel::Serializer
  attributes :id, :source, :title, :description, :abilities_hint, :hit_dice, :proficiencies, :multiclassing, :initial_equipment, :spellcasting, :features, :default
  has_one :creator

  def default
    object.default?
  end
end
