json.array!(@receipes) do |receipe|
  json.extract! receipe, :id, :company_id, :greenhouse_id, :date
  json.url receipe_url(receipe, format: :json)
end
