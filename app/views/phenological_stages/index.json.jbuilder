json.array!(@phenological_stages) do |phenological_stage|
  json.extract! phenological_stage, :id, :name, :description, :leachate_ids
  json.url phenological_stage_url(phenological_stage, format: :json)
end
