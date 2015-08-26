json.array!(@product_application_buys) do |product_application_buy|
  json.extract! product_application_buy, :id, :greenhouse_id, :buy_date, :application_product_id, :unit, :quanity, :unit_cost, :total_cost, :supplier_id
  json.url product_application_buy_url(product_application_buy, format: :json)
end
