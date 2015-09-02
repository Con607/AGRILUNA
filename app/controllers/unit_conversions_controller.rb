class UnitConversionsController < ApplicationController
  before_action :set_unit_conversion, only: [:show, :edit, :update, :destroy]

  # GET /unit_conversions
  # GET /unit_conversions.json
  def index
    @unit_conversions = UnitConversion.all
    @unit_conversion = UnitConversion.new
    @unit_types = UnitType.all
  end

  # GET /unit_conversions/1
  # GET /unit_conversions/1.json
  def show
  end

  # GET /unit_conversions/new
  def new
    @unit_conversion = UnitConversion.new
  end

  # GET /unit_conversions/1/edit
  def edit
  end

  # POST /unit_conversions
  # POST /unit_conversions.json
  def create
    @unit_conversion = UnitConversion.new(unit_conversion_params)

    respond_to do |format|
      if @unit_conversion.save
        format.js
        format.html { redirect_to @unit_conversion, notice: 'Unit conversion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unit_conversion }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @unit_conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_conversions/1
  # PATCH/PUT /unit_conversions/1.json
  def update
    respond_to do |format|
      if @unit_conversion.update(unit_conversion_params)
        format.html { redirect_to @unit_conversion, notice: 'Unit conversion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit_conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_conversions/1
  # DELETE /unit_conversions/1.json
  def destroy
    @unit_conversion.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to unit_conversions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_conversion
      @unit_conversion = UnitConversion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_conversion_params
      params.require(:unit_conversion).permit(:unit_type_id, :convert_to, :value)
    end
end
