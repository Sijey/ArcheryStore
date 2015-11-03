class AddQuantityToLinaItems < ActiveRecord::Migration
  def change
    add_column :lina_items, :quantity, :integer, default: 1
  end
end
