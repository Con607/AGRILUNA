json.array!(@environments) do |environment|
  json.extract! environment, :id, :name, :description, :environmental_condition_ids
  json.url environment_url(environment, format: :json)
end
