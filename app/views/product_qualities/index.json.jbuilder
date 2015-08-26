json.array!(@product_qualities) do |product_quality|
  json.extract! product_quality, :id, :name, :description, :selection_item_ids, :sale_item_ids, :product_id
  json.url product_quality_url(product_quality, format: :json)
end
