json.array!(@harvests) do |harvest|
  json.extract! harvest, :id, :event_date, :greenhouse_id, :product_id, :product_variety_id, :product_presentation_id, :product_quantity, :total_harvested
  json.url harvest_url(harvest, format: :json)
end
