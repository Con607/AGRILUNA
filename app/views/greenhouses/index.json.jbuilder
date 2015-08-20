json.array!(@greenhouses) do |greenhouse|
  json.extract! greenhouse, :id, :name, :description, :location, :employee_ids
  json.url greenhouse_url(greenhouse, format: :json)
end
