class CreateLinaItems < ActiveRecord::Migration
  def change
    create_table :lina_items do |t|
      t.references :product, index: true, foreign_key: true
      t.belongs_to :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end