class CreateHeroTalents < ActiveRecord::Migration[6.1]
  def change
    create_table :hero_talents do |t|
      t.references :hero, null: false, foreign_key: true
      t.references :talent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
