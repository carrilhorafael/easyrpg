class AddSubclassFromToGameClass < ActiveRecord::Migration[6.1]
  def change
    add_column :game_classes, :subclasses, :jsonb, default: {}
  end
end
