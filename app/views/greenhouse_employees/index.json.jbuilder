json.array!(@greenhouse_employees) do |greenhouse_employee|
  json.extract! greenhouse_employee, :id, :greenhouse_id, :employee_id
  json.url greenhouse_employee_url(greenhouse_employee, format: :json)
end
