class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :validation_token
      t.datetime :validation_token_expires_at

      t.timestamps
    end
  end
end
