json.array!(@job_positions) do |job_position|
  json.extract! job_position, :id, :name, :description, :employee_ids
  json.url job_position_url(job_position, format: :json)
end
