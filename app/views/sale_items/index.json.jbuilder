json.array!(@sale_items) do |sale_item|
  json.extract! sale_item, :id, :sale_id, :product_quality_id, :quantity, :unit_price, :total_price, :status
  json.url sale_item_url(sale_item, format: :json)
end
