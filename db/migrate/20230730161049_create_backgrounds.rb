class CreateBackgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :backgrounds do |t|
      t.string :title
      t.string :description
      t.string :source
      t.jsonb :proficiencies, default: {}
      t.jsonb :features, default: {}
      t.jsonb :initial_equipment, default: {}
      t.references :creator, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
