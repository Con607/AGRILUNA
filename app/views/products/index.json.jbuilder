json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :product_variety_ids, :product_presentation_ids, :product_quality_ids, :harvest_ids, :selection_ids, :sale_ids
  json.url product_url(product, format: :json)
end
