class EnvironmentalConditionsController < ApplicationController
  before_action :set_environmental_condition, only: [:show, :edit, :update, :destroy]

  # GET /environmental_conditions
  # GET /environmental_conditions.json
  def index
    @environmental_conditions = EnvironmentalCondition.all
    @environmental_condition = EnvironmentalCondition.new
  end

  # GET /environmental_conditions/1
  # GET /environmental_conditions/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /environmental_conditions/new
  def new
    @environmental_condition = EnvironmentalCondition.new
  end

  # GET /environmental_conditions/1/edit
  def edit
  end

  # POST /environmental_conditions
  # POST /environmental_conditions.json
  def create
    @environmental_condition = EnvironmentalCondition.new(environmental_condition_params)

    respond_to do |format|
      if @environmental_condition.save
        format.js
        format.html { redirect_to @environmental_condition, notice: 'Environmental condition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @environmental_condition }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @environmental_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environmental_conditions/1
  # PATCH/PUT /environmental_conditions/1.json
  def update
    respond_to do |format|
      if @environmental_condition.update(environmental_condition_params)
        format.html { redirect_to @environmental_condition, notice: 'Environmental condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @environmental_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environmental_conditions/1
  # DELETE /environmental_conditions/1.json
  def destroy
    @environmental_condition.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to environmental_conditions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environmental_condition
      @environmental_condition = EnvironmentalCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environmental_condition_params
      params.require(:environmental_condition).permit(:event_date, :greenhouse_id, :environment_id, :max_temp, :min_temp, :max_rel_humidity, :min_rel_humidity, :weather_id)
    end
end
