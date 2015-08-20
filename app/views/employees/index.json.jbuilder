json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :second_name, :last_name, :second_last_name, :salary, :greenhouse_id, :job_position_id
  json.url employee_url(employee, format: :json)
end
