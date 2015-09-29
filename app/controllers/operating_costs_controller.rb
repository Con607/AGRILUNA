class OperatingCostsController < ApplicationController
  before_action :set_operating_cost, only: [:show, :edit, :update, :destroy]
  before_action :set_total, only: [:update, :create]

  # GET /operating_costs
  # GET /operating_costs.json
  def index
    if params[:search]
      company_id = params[:search][:company_id]
      greenhouse_id = params[:search][:greenhouse_id]
      @show_operating_costs = true
      @greenhouse = Greenhouse.find(greenhouse_id)
      @cycle = Cycle.where(greenhouse_id: greenhouse_id).active.first
      from_date = @cycle.start_date
      to_date = @cycle.end_date
      @operating_costs = OperatingCost.where(greenhouse_id: greenhouse_id).where(event_date: from_date..to_date).order(:event_date)
      @operating_cost = OperatingCost.new
    else
      @show_operating_costs == false
      @companies = current_user.companies
      @greenhouses = Greenhouse.where(company_id: @companies.first.id..@companies.last.id)
    end
  end

  # GET /operating_costs/1
  # GET /operating_costs/1.json
  def show
  end

  # GET /operating_costs/new
  def new
    @operating_cost = OperatingCost.new
  end

  # GET /operating_costs/1/edit
  def edit
  end

  # POST /operating_costs
  # POST /operating_costs.json
  def create
    @operating_cost = OperatingCost.new(operating_cost_params)

    respond_to do |format|
      if @operating_cost.save
        format.js
        format.html { redirect_to @operating_cost, notice: 'Operating cost was successfully created.' }
        format.json { render action: 'show', status: :created, location: @operating_cost }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @operating_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operating_costs/1
  # PATCH/PUT /operating_costs/1.json
  def update
    respond_to do |format|
      if @operating_cost.update(operating_cost_params)
        format.html { redirect_to @operating_cost, notice: 'Operating cost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @operating_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operating_costs/1
  # DELETE /operating_costs/1.json
  def destroy
    @operating_cost.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to operating_costs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operating_cost
      @operating_cost = OperatingCost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operating_cost_params
      params.require(:operating_cost).permit(:greenhouse_id, :event_date, :concept, :display, :unit_price, :quantity, :total)
    end

    def set_total
      quantity = params[:operating_cost][:quantity].to_i
      unit_price = params[:operating_cost][:unit_price].to_f
      params[:operating_cost][:total] = quantity * unit_price
    end

end
