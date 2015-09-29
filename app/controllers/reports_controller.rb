class ReportsController < ApplicationController
  

  def index
  end


  def quick_general_status
    if params[:report]
      @show_report = true
      @company = Company.find(params[:report][:company_id])
      @number_of_kgs = 0
      @cycles = Cycle.active
      @greenhouses_expenses = 0
      @greenhouses_sales = 0
      @cycles.each do |cycle|
        from_date = cycle.start_date
        to_date = cycle.end_date
        greenhouse_manpower_cost = cycle.greenhouse.pay_rolls.where(start_date: from_date..to_date).sum(:total)
        greenhouse_fertigation_cost = cycle.greenhouse.fertigations.where(fertigation_datetime: from_date..to_date).sum(:total_cost)
        greenhouse_application_cost = cycle.greenhouse.applications.where(application_date: from_date..to_date).sum(:application_cost)
        greenhouse_operating_cost = cycle.greenhouse.operating_costs.where(event_date: from_date..to_date).sum(:total)
        @greenhouses_expenses += greenhouse_manpower_cost + greenhouse_fertigation_cost + greenhouse_application_cost + greenhouse_operating_cost
        @greenhouses_sales += cycle.greenhouse.sales.where(event_date: from_date..to_date).sum(:total_price)
      end
      from_date = @cycles.order(start_date: :asc).first.start_date
      to_date = @cycles.order(end_date: :desc).first.end_date
      @administration_cost = @company.administration_costs.where(event_date: from_date..to_date).sum(:total)
      @profits_or_loses = @greenhouses_sales - (@greenhouses_expenses + @administration_cost)
    else
      @companies = current_user.companies
    end
  end


end
