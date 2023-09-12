class CreateHeroGameClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :hero_game_classes do |t|
      t.references :hero, null: false, foreign_key: true
      t.references :game_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
