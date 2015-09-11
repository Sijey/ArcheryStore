class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.float  :price
    	t.string :description
    	t.float  :weight
      t.timestamps null: false
    end
  end
end
