class CreateTalents < ActiveRecord::Migration[6.1]
  def change
    create_table :talents do |t|
      t.string :title
      t.jsonb :prerequisites
      t.jsonb :features
      t.references :creator, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
