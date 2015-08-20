json.array!(@application_items) do |application_item|
  json.extract! application_item, :id, :application_id, :application_product_id, :unit_of_measure, :quantity, :h2o_quantity_liters, :total_product_used, :cost_per_unit, :total_cost
  json.url application_item_url(application_item, format: :json)
end
