class ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def quick_general_status
  	@manpower_cost = PayRoll.all.sum(:total)
  	@fertigation_cost = Fertigation.all.sum(:total_cost)
  	@application_cost = Application.all.sum(:application_cost)
  	@operating_cost = OperatingCost.all.sum(:total)
  	@administration_cost = AdministrationCost.all.sum(:total)
  	@total_expenses = @manpower_cost + @fertigation_cost + @application_cost + @operating_cost + @administration_cost

  	# Here need to create a cycle with all this variables created at the start of the cycle
  	# using static values for now
  	@estimated_performance_per_m2 = 18 
  	@greenhouse_estimated_performance = 2500 * @estimated_performance_per_m2
  	@maximum_estimated_production_cost = 3
  	@expected_average_selling_price_per_kg = 8
  	@expected_total_expenses = @maximum_estimated_production_cost * @greenhouse_estimated_performance
  	@expected_total_profit = ((@expected_average_selling_price_per_kg * @greenhouse_estimated_performance) - 
  										(@maximum_estimated_production_cost * @greenhouse_estimated_performance))

  	@performance_per_m2 = Harvest.all.sum(:total_harvested) / 2500 
  	@greenhouse_performance = 2500 * @performance_per_m2
  	@production_cost = @total_expenses / @greenhouse_performance
  	@average_selling_price_per_kg = Sale.all.sum(:total_price) / Sale.all.count
  	@total_profit = ((@average_selling_price_per_kg * @greenhouse_performance) - 
  										(@production_cost * @greenhouse_performance))
  end
end
