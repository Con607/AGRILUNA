class CyclesController < ApplicationController
  before_action :set_cycle, only: [:show, :edit, :update, :destroy]
  before_action :do_calcs, only: [:create, :update]

  # GET /cycles
  # GET /cycles.json
  def index
    @cycles = Cycle.all
    @cycle = Cycle.new
  end

  # GET /cycles/1
  # GET /cycles/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /cycles/new
  def new
    @cycle = Cycle.new
  end

  # GET /cycles/1/edit
  def edit
  end

  # POST /cycles
  # POST /cycles.json
  def create
    @cycle = Cycle.new(cycle_params)

    respond_to do |format|
      if @cycle.save
        format.js
        format.html { redirect_to @cycle, notice: 'Cycle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cycle }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycles/1
  # PATCH/PUT /cycles/1.json
  def update
    respond_to do |format|
      if @cycle.update(cycle_params)
        format.html { redirect_to @cycle, notice: 'Cycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycles/1
  # DELETE /cycles/1.json
  def destroy
    @cycle.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to cycles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cycle_params
      params.require(:cycle).permit(:greenhouse_id, :name, :start_date, :end_date, :estimated_performance_per_m2, 
        :greenhouse_estimated_performance, :active,
        :maximum_estimated_production_cost, :expected_average_selling_price_per_kg, :expected_total_expenses, 
        :expected_total_profit)
    end

    def do_calcs
      greenhouse = Greenhouse.find(params[:cycle][:greenhouse_id])
      params[:cycle][:greenhouse_estimated_performance] = params[:cycle][:estimated_performance_per_m2].to_f * greenhouse.area
      params[:cycle][:expected_total_expenses] = params[:cycle][:maximum_estimated_production_cost].to_f * params[:cycle][:greenhouse_estimated_performance].to_f
      params[:cycle][:expected_total_profit] =  (params[:cycle][:greenhouse_estimated_performance].to_f * params[:cycle][:expected_average_selling_price_per_kg].to_f) - params[:cycle][:expected_total_expenses].to_f
    end
end
