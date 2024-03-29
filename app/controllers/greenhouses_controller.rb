class GreenhousesController < ApplicationController
  before_action :set_greenhouse, only: [:show, :edit, :update, :destroy]

  # GET /greenhouses
  # GET /greenhouses.json
  def index
    @greenhouses = Greenhouse.all
  end

  # GET /greenhouses/1
  # GET /greenhouses/1.json
  def show
  end

  # GET /greenhouses/new
  def new
    @greenhouse = Greenhouse.new
  end

  # GET /greenhouses/1/edit
  def edit
  end

  # POST /greenhouses
  # POST /greenhouses.json
  def create
    @greenhouse = Greenhouse.new(greenhouse_params)

    respond_to do |format|
      if @greenhouse.save
        format.html { redirect_to @greenhouse, notice: 'Greenhouse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @greenhouse }
      else
        format.html { render action: 'new' }
        format.json { render json: @greenhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greenhouses/1
  # PATCH/PUT /greenhouses/1.json
  def update
    respond_to do |format|
      if @greenhouse.update(greenhouse_params)
        format.html { redirect_to @greenhouse, notice: 'Greenhouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @greenhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greenhouses/1
  # DELETE /greenhouses/1.json
  def destroy
    @greenhouse.destroy
    respond_to do |format|
      format.html { redirect_to greenhouses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greenhouse
      @greenhouse = Greenhouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def greenhouse_params
      params.require(:greenhouse).permit(:name, :description, :location, :company_id, 
                    :area, :assistance_ids, :event_ids, :cycle_ids, :greenhouse_employee_ids => [], :employee_ids => [])
    end
end
