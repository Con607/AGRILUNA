json.array!(@cycles) do |cycle|
  json.extract! cycle, :id, :greenhouse_id, :name, :start_date, :end_date, :estimated_performance_per_m2, :greenhouse_estimated_performance, :maximum_estimated_production_cost, :expected_average_selling_price_per_kg, :expected_total_expenses, :expected_total_profit
  json.url cycle_url(cycle, format: :json)
end
