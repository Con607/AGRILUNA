json.array!(@roles) do |role|
  json.extract! role, :id, :company_id, :user_ids, :name, :description, :role_permission_ids
  json.url role_url(role, format: :json)
end
