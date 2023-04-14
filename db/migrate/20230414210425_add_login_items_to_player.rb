class AddLoginItemsToPlayer < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :last_login_at, :datetime
    add_column :players, :login_count, :integer, default: 0
  end
end
