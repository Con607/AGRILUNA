json.array!(@permissions) do |permission|
  json.extract! permission, :id, :role_permission_ids, :name, :description
  json.url permission_url(permission, format: :json)
end
