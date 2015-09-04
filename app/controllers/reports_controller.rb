class ReportsController < ApplicationController
  

  def index
  end


  def quick_general_status
    if params[:report]
      @show_report = true
      @company = Company.find(params[:report][:company_id])
      @number_of_kgs = 0
    else
      @companies = current_user.companies
    end
  end


end
