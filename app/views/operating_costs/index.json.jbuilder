json.array!(@operating_costs) do |operating_cost|
  json.extract! operating_cost, :id, :greenhouse_id, :event_date, :concept, :display, :unit_price, :quantity, :total
  json.url operating_cost_url(operating_cost, format: :json)
end
