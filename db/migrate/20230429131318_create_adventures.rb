class CreateAdventures < ActiveRecord::Migration[6.1]
  def change
    create_table :adventures do |t|
      t.string :name
      t.references :gamemaster, null: false, foreign_key: { to_table: :players }
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
