json.array!(@user_companies) do |user_company|
  json.extract! user_company, :id, :user_id, :company_id
  json.url user_company_url(user_company, format: :json)
end
