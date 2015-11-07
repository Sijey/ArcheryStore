atom_feed do |feed|
	feed.name "who_bought #{@product.name}"

	feed.updated @latest_order.try(:updated_at)

	@product.orders.each do |order|
		feed.entry(order) do |entry|
			entry.name "Order #{order.id}"
			entry.summary type: 'xhtml' do |xhtml|
				xhtml.p "Shipped to #{order.address}"

				xhtml.table do 
					xhtml.tr do
						xhtml.th 'product'
						xhtml.th 'quantity'
						xhtml.th 'total_price'
					end
					order.lina_items.each do |item|
						xhtml.tr do
							xhtml.td item.product.name
							xhtml.td item.quantity
							xhtml.td number_to_currency item.total_price
						end
					end

				xhtml.tr do 
					xhtml.th 'total', colspan: 2
					xhtml.th number_to_currency \
						order.lina_items.map(&:total_price).sum
				end
			end

				xhtml.p "Paid by #{order.pay_type}"
			end
			entry.author do |author|
				author.name order.name
				author.surname order.surname
				author.email order.email
			end
		end
	end
end