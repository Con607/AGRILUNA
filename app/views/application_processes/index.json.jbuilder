json.array!(@application_processes) do |application_process|
  json.extract! application_process, :id, :application_ids, :name, :description
  json.url application_process_url(application_process, format: :json)
end
