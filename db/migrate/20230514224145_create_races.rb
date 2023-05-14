class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :title
      t.string :source
      t.references :creator, foreign_key: { to_table: :players }
      t.boolean :only_subraces, default: false
      t.string :normal_size
      t.jsonb :features, default: {}
      t.jsonb :caracteristics, default: {}
      t.jsonb :abilities, default: {}
      t.jsonb :speeds, default: {}
      t.jsonb :languages, default: {}

      t.timestamps
    end
  end
end
