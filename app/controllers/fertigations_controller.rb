class FertigationsController < ApplicationController
  before_action :set_fertigation, only: [:show, :edit, :update, :destroy]

  # GET /fertigations
  # GET /fertigations.json
  def index
    @fertigations = Fertigation.all
    @fertigation = Fertigation.new
  end

  # GET /fertigations/1
  # GET /fertigations/1.json
  def show
    @fertigation_item = FertigationItem.new
    @fertigation_items = @fertigation.fertigation_items
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /fertigations/new
  def new
    @fertigation = Fertigation.new
    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  # GET /fertigations/1/edit
  def edit
  end

  # POST /fertigations
  # POST /fertigations.json
  def create
    @fertigation = Fertigation.new(fertigation_params)

    respond_to do |format|
      if @fertigation.save
        format.js
        format.html { redirect_to @fertigation, notice: 'Fertigation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fertigation }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @fertigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fertigations/1
  # PATCH/PUT /fertigations/1.json
  def update
    respond_to do |format|
      if @fertigation.update(fertigation_params)
        format.html { redirect_to @fertigation, notice: 'Fertigation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fertigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fertigations/1
  # DELETE /fertigations/1.json
  def destroy
    @fertigation.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to fertigations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fertigation
      @fertigation = Fertigation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fertigation_params
      params.require(:fertigation).permit(:greenhouse_id, :fertigation_datetime, :tank, :fertigation_item_ids, :total_cost)
    end
end
