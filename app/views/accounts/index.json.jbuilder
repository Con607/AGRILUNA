json.array!(@accounts) do |account|
  json.extract! account, :id, :user_id, :plan_id
  json.url account_url(account, format: :json)
end
