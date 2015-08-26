json.array!(@product_presentations) do |product_presentation|
  json.extract! product_presentation, :id, :name, :description, :harvest_ids, :selection_ids, :sale_ids, :product_id
  json.url product_presentation_url(product_presentation, format: :json)
end
