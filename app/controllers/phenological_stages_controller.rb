class PhenologicalStagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_phenological_stage, only: [:show, :edit, :update, :destroy]

  # GET /phenological_stages
  # GET /phenological_stages.json
  def index
    @phenological_stages = PhenologicalStage.all
    @phenological_stage = PhenologicalStage.new
  end

  # GET /phenological_stages/1
  # GET /phenological_stages/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /phenological_stages/new
  def new
    @phenological_stage = PhenologicalStage.new
  end

  # GET /phenological_stages/1/edit
  def edit
  end

  # POST /phenological_stages
  # POST /phenological_stages.json
  def create
    @phenological_stage = PhenologicalStage.new(phenological_stage_params)

    respond_to do |format|
      if @phenological_stage.save
        format.js
        format.html { redirect_to @phenological_stage, notice: 'Phenological stage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @phenological_stage }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @phenological_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phenological_stages/1
  # PATCH/PUT /phenological_stages/1.json
  def update
    respond_to do |format|
      if @phenological_stage.update(phenological_stage_params)
        format.html { redirect_to @phenological_stage, notice: 'Phenological stage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @phenological_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phenological_stages/1
  # DELETE /phenological_stages/1.json
  def destroy
    @phenological_stage.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to phenological_stages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phenological_stage
      @phenological_stage = PhenologicalStage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phenological_stage_params
      params.require(:phenological_stage).permit(:name, :description, :leachate_ids)
    end
end
