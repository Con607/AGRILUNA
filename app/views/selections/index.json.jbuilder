json.array!(@selections) do |selection|
  json.extract! selection, :id, :event_date, :greenhouse_id, :product_id, :product_variety_id, :product_presentation_id, :total_weight, :selection_item_ids
  json.url selection_url(selection, format: :json)
end
