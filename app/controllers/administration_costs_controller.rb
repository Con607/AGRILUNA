class AdministrationCostsController < ApplicationController
  before_action :set_administration_cost, only: [:show, :edit, :update, :destroy]
  before_action :set_total, only: [:update, :create]


  # GET /administration_costs
  # GET /administration_costs.json
  def index
    if params[:search]
      @current_company = Company.find(params[:search][:company_id])
      @administration_costs = AdministrationCost.where(company_id: @current_company.id).order(:event_date)
      @administration_cost = AdministrationCost.new
      @show_administration_costs = true
    else
      @companies = current_user.companies
      @show_administration_costs = false
    end
  end

  # GET /administration_costs/1
  # GET /administration_costs/1.json
  def show
  end

  # GET /administration_costs/new
  def new
    @administration_cost = AdministrationCost.new
  end

  # GET /administration_costs/1/edit
  def edit
  end

  # POST /administration_costs
  # POST /administration_costs.json
  def create
    @administration_cost = AdministrationCost.new(administration_cost_params)

    respond_to do |format|
      if @administration_cost.save
        # Create apportionments per greenhouse
        @cycles = Cycle.where(active: true)
        @area_sum = 0.0
        @cycles.each do |cycle|
          @area_sum += cycle.greenhouse.area
        end
        @total_amount = @administration_cost.total
        @cycles.each do |cycle|
          event_date = @administration_cost.event_date
          greenhouse = cycle.greenhouse
          greenhouse_id = greenhouse.id
          area = greenhouse.area
          percentage = (area * 100) / @area_sum
          amount = @total_amount * (percentage / 100)
          @apportionment_per_greenhouse = @administration_cost.apportionment_per_greenhouses.create(event_date: event_date,
                                                                                                    greenhouse_id: greenhouse_id,
                                                                                                    percentage: percentage,
                                                                                                    amount: amount)
        end

        format.js
        format.html { redirect_to @administration_cost, notice: 'Administration cost was successfully created.' }
        format.json { render action: 'show', status: :created, location: @administration_cost }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @administration_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administration_costs/1
  # PATCH/PUT /administration_costs/1.json
  def update
    respond_to do |format|
      if @administration_cost.update(administration_cost_params)
        format.html { redirect_to @administration_cost, notice: 'Administration cost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @administration_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration_costs/1
  # DELETE /administration_costs/1.json
  def destroy
    @administration_cost.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to administration_costs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administration_cost
      @administration_cost = AdministrationCost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administration_cost_params
      params.require(:administration_cost).permit(:company_id, :event_date, :concept, :display, :unit_price, :quantity, :total)
    end

    def set_total
      quantity = params[:administration_cost][:quantity].to_i
      unit_price = params[:administration_cost][:unit_price].to_f
      params[:administration_cost][:total] = quantity * unit_price
    end

end
