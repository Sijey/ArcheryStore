json.array!(@lina_items) do |lina_item|
  json.extract! lina_item, :id, :product_id, :cart_id
  json.url lina_item_url(lina_item, format: :json)
end
