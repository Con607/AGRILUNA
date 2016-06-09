class ApportionmentPerGreenhousesController < ApplicationController
  before_action :set_apportionment_per_greenhouse, only: [:show, :edit, :update, :destroy]

  # GET /apportionment_per_greenhouses
  # GET /apportionment_per_greenhouses.json
  def index
    @apportionment_per_greenhouses = ApportionmentPerGreenhouse.all
    @apportionment_per_greenhouse = ApportionmentPerGreenhouse.new
  end

  # GET /apportionment_per_greenhouses/1
  # GET /apportionment_per_greenhouses/1.json
  def show
  end

  # GET /apportionment_per_greenhouses/new
  def new
    @apportionment_per_greenhouse = ApportionmentPerGreenhouse.new
  end

  # GET /apportionment_per_greenhouses/1/edit
  def edit
  end

  # POST /apportionment_per_greenhouses
  # POST /apportionment_per_greenhouses.json
  def create
    @apportionment_per_greenhouse = ApportionmentPerGreenhouse.new(apportionment_per_greenhouse_params)

    respond_to do |format|
      if @apportionment_per_greenhouse.save
        format.html { redirect_to @apportionment_per_greenhouse, notice: 'Apportionment per greenhouse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apportionment_per_greenhouse }
      else
        format.html { render action: 'new' }
        format.json { render json: @apportionment_per_greenhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apportionment_per_greenhouses/1
  # PATCH/PUT /apportionment_per_greenhouses/1.json
  def update
    respond_to do |format|
      if @apportionment_per_greenhouse.update(apportionment_per_greenhouse_params)
        format.html { redirect_to @apportionment_per_greenhouse, notice: 'Apportionment per greenhouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apportionment_per_greenhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apportionment_per_greenhouses/1
  # DELETE /apportionment_per_greenhouses/1.json
  def destroy
    @apportionment_per_greenhouse.destroy
    respond_to do |format|
      format.html { redirect_to apportionment_per_greenhouses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apportionment_per_greenhouse
      @apportionment_per_greenhouse = ApportionmentPerGreenhouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apportionment_per_greenhouse_params
      params.require(:apportionment_per_greenhouse).permit(:event_date, :administration_cost_id, :greenhouse_id, :percentage, :amount)
    end
end
