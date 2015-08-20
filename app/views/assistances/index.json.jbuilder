json.array!(@assistances) do |assistance|
  json.extract! assistance, :id, :employee_id, :assistance_date, :assisted
  json.url assistance_url(assistance, format: :json)
end
