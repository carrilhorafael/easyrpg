class CreateHeroes < ActiveRecord::Migration[6.1]
  def change
    create_table :heroes do |t|
      t.string :name
      t.jsonb :body_traits, default: {}
      t.jsonb :personality_traits, default: {}
      t.references :adventure, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :race, foreign_key: true
      t.references :background, foreign_key: true

      t.timestamps
    end
  end
end
