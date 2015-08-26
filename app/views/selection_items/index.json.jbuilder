json.array!(@selection_items) do |selection_item|
  json.extract! selection_item, :id, :selection_id, :product_quality_id, :quantity
  json.url selection_item_url(selection_item, format: :json)
end
