json.array!(@administration_costs) do |administration_cost|
  json.extract! administration_cost, :id, :greenhouse_id, :event_date, :concept, :display, :unit_price, :quantity, :total
  json.url administration_cost_url(administration_cost, format: :json)
end
