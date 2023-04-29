class CreateActivityLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_logs do |t|
      t.string :text
      t.references :performer, null: false, foreign_key: { to_table: :players }
      t.references :session, foreign_key: { to_table: :adventure_sessions }
      t.references :adventure, null: false, foreign_key: true
      t.jsonb :extra, default: {}
      t.string :activity

      t.timestamps
    end
  end
end
