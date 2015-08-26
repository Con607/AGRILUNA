class LeachatesController < ApplicationController
  before_action :set_leachate, only: [:show, :edit, :update, :destroy]

  # GET /leachates
  # GET /leachates.json
  def index
    @leachates = Leachate.all
    @leachate = Leachate.new
  end

  # GET /leachates/1
  # GET /leachates/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /leachates/new
  def new
    @leachate = Leachate.new
  end

  # GET /leachates/1/edit
  def edit
  end

  # POST /leachates
  # POST /leachates.json
  def create
    @leachate = Leachate.new(leachate_params)

    respond_to do |format|
      if @leachate.save
        format.js
        format.html { redirect_to @leachate, notice: 'Leachate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @leachate }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @leachate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leachates/1
  # PATCH/PUT /leachates/1.json
  def update
    respond_to do |format|
      if @leachate.update(leachate_params)
        format.html { redirect_to @leachate, notice: 'Leachate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @leachate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leachates/1
  # DELETE /leachates/1.json
  def destroy
    @leachate.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to leachates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leachate
      @leachate = Leachate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leachate_params
      params.require(:leachate).permit(:event_date, :greenhouse_id, :ddt, :ph_nutritive_solution, :ce_nutritive_solution, :dropper_spending, :ph_leachate, :ce_leachate, :irrigations, :phenological_stage_id)
    end
end
