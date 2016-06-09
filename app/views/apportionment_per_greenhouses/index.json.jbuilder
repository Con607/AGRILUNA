json.array!(@apportionment_per_greenhouses) do |apportionment_per_greenhouse|
  json.extract! apportionment_per_greenhouse, :id, :event_date, :administration_cost_id, :greenhouse_id, :percentage, :amount
  json.url apportionment_per_greenhouse_url(apportionment_per_greenhouse, format: :json)
end
