json.array!(@weathers) do |weather|
  json.extract! weather, :id, :name, :description, :environmental_condition_ids
  json.url weather_url(weather, format: :json)
end
