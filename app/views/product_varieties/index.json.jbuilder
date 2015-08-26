json.array!(@product_varieties) do |product_variety|
  json.extract! product_variety, :id, :name, :description, :harvest_ids, :selection_ids, :sale_ids, :product_id
  json.url product_variety_url(product_variety, format: :json)
end
