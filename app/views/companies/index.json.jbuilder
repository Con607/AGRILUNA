json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :address, :telephone, :greenhouse_ids
  json.url company_url(company, format: :json)
end
