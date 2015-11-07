class AddOrderToLinaItem < ActiveRecord::Migration
  def change
    add_reference :lina_items, :order, index: true, foreign_key: true
  end
end
