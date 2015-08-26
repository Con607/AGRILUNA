json.array!(@leachates) do |leachate|
  json.extract! leachate, :id, :event_date, :greenhouse_id, :ddt, :ph_nutritive_solution, :ce_nutritive_solution, :dropper_spending, :ph_leachate, :ce_leachate, :irrigations, :phenological_stage_id
  json.url leachate_url(leachate, format: :json)
end
