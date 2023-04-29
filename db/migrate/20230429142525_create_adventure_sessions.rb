class CreateAdventureSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :adventure_sessions do |t|
      t.date :date
      t.string :title
      t.string :description
      t.references :adventure, null: false, foreign_key: true
      t.datetime :finished_at

      t.timestamps
    end
  end
end
