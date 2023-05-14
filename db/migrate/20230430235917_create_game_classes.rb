class CreateGameClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :game_classes do |t|
      t.string :title
      t.string :description
      t.string :abilities_hint
      t.string :source
      t.string :hit_dice
      t.jsonb :proficiencies, default: {}
      t.jsonb :multiclassing, default: {}
      t.jsonb :initial_equipment, default: {}
      t.jsonb :spellcasting
      t.jsonb :features, default: {}
      t.references :creator, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
