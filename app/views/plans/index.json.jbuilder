json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :company_ids, :greenhouse_ids, :user_ids, :users_allowed, :companies_allowed, :greenhouses_allowed, :cost_per_month_usd, :billing
  json.url plan_url(plan, format: :json)
end
