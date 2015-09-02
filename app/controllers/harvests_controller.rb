class HarvestsController < ApplicationController
  before_action :set_harvest, only: [:show, :edit, :update, :destroy]
  before_action :get_total_harvested, only: [:update, :create]

  # GET /harvests
  # GET /harvests.json
  def index
    @harvests = Harvest.all
    @harvest = Harvest.new
  end

  # GET /harvests/1
  # GET /harvests/1.json
  def show
    respond_to do |format| 
      format.js
      format.html
    end
  end

  # GET /harvests/new
  def new
    @harvest = Harvest.new
  end

  # GET /harvests/1/edit
  def edit
  end

  # POST /harvests
  # POST /harvests.json
  def create
    @harvest = Harvest.new(harvest_params)

    respond_to do |format|
      if @harvest.save
        format.js
        format.html { redirect_to @harvest, notice: 'Harvest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @harvest }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @harvest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /harvests/1
  # PATCH/PUT /harvests/1.json
  def update
    respond_to do |format|
      if @harvest.update(harvest_params)
        format.html { redirect_to @harvest, notice: 'Harvest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @harvest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /harvests/1
  # DELETE /harvests/1.json
  def destroy
    @harvest.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to harvests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_harvest
      @harvest = Harvest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def harvest_params
      params.require(:harvest).permit(:event_date, :greenhouse_id, :product_id, :product_variety_id, 
        :product_presentation_id, :product_quantity, :total_harvested)
    end

    def get_total_harvested
      product_quantity = params[:harvest][:product_quantity].to_i
      params[:harvest][:total_harvested] = product_quantity * 20 # IMPLEMENT UNIT HERE TO MULTIPLY IT PROPERLY INSTEAD OF 20
    end

end
