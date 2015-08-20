json.array!(@applications) do |application|
  json.extract! application, :id, :application_date, :application_process_id, :purpose, :greenhouse_id, :application_item_ids, :application_cost
  json.url application_url(application, format: :json)
end
