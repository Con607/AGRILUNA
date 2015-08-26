json.array!(@fertigation_items) do |fertigation_item|
  json.extract! fertigation_item, :id, :fertigation_id, :application_product_id, :unit_measure, :fertilizer_quantity, :h20_quantity, :concentration, :injection_rate, :fertilizer_cost_per_unit, :cost
  json.url fertigation_item_url(fertigation_item, format: :json)
end
