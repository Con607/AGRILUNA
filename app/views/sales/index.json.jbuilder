json.array!(@sales) do |sale|
  json.extract! sale, :id, :event_date, :poduct_id, :product_variety_id, :product_presentation_id, :total_price, :status, :sale_item_ids
  json.url sale_url(sale, format: :json)
end
