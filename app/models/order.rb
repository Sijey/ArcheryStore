class Order < ActiveRecord::Base
	has_many :lina_items, dependent: :destroy
	PAYMENT_TYPES = ["Наличными", "Кредитной картой"]
	validates :name, :surname, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	def add_lina_items_from_cart(cart)
		cart.lina_items.each do |i|
			i.cart_id = nil
			lina_items << i
		end
	end
end
