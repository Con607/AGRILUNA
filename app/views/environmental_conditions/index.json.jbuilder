json.array!(@environmental_conditions) do |environmental_condition|
  json.extract! environmental_condition, :id, :event_date, :greenhouse_id, :environment_id, :max_temp, :min_temp, :max_rel_humidity, :min_rel_humidity, :weather_id
  json.url environmental_condition_url(environmental_condition, format: :json)
end
