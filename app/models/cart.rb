class Cart < ActiveRecord::Base
	has_many :lina_items, dependent: :destroy

    def total_price
        lina_items.to_a.sum { |item| item.total_price }
    end
	def add_product(product_id)
		current_item = lina_items.find_by(product_id: product_id)
     	if current_item
        	current_item.quantity += 1
		else
        	current_item = lina_items.build(product_id: product_id)
     	end
     	current_item
    end
end
