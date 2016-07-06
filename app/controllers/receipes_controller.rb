class ReceipesController < ApplicationController
  before_action :set_receipe, only: [:show, :edit, :update, :destroy]
  before_action :get_greenhouse, only: [:create, :update]
  before_action :get_company, only: [:create, :update]
  before_action :get_dates_range, only: [:create, :update]

  # GET /receipes
  # GET /receipes.json
  def index
    if params[:search]
      company_id = params[:search][:company_id]
      @current_company = Company.find(params[:search][:company_id])
      @company = Company.find(company_id)
      @companies = current_user.companies
      greenhouse_id = params[:search][:greenhouse_id]
      @greenhouse = Greenhouse.find(greenhouse_id)
      @month_start = Date.civil(params[:search]["month_start(1i)"].to_i,
                                params[:search]["month_start(2i)"].to_i,
                                params[:search]["month_start(3i)"].to_i)
      @month_end = Date.civil(params[:search]["month_end(1i)"].to_i,
                                params[:search]["month_end(2i)"].to_i,
                                params[:search]["month_end(3i)"].to_i)
      @receipes = Receipe.where(company_id: @current_company.id
                                                  ).where(greenhouse_id: @greenhouse.id
                                                  ).where(date: @month_start..@month_end
                                                  ).order(:date)
      @receipe = Receipe.new
      @show_receipes = true
    else
      @companies = current_user.companies
      @greenhouses = Greenhouse.where(company_id: @companies.first.id..@companies.last.id)
      @show_receipes = false
    end
  end

  # GET /receipes/1
  # GET /receipes/1.json
  def show
  end

  # GET /receipes/new
  def new
    @receipe = Receipe.new
  end

  # GET /receipes/1/edit
  def edit
  end

  # POST /receipes
  # POST /receipes.json
  def create
    @receipe = Receipe.new(receipe_params)
    @receipes = Receipe.where(
                              company_id: @company.id).where(
                              greenhouse_id: @greenhouse.id).where(
                              date: @month_start..@month_end).order(:date)

    respond_to do |format|
      if @receipe.save
        format.js
        format.html { redirect_to @receipe, notice: 'Receipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @receipe }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @receipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipes/1
  # PATCH/PUT /receipes/1.json
  def update
    respond_to do |format|
      if @receipe.update(receipe_params)
        format.html { redirect_to @receipe, notice: 'Receipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipes/1
  # DELETE /receipes/1.json
  def destroy
    @receipe.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to receipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipe
      @receipe = Receipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipe_params
      params.require(:receipe).permit(:company_id, :greenhouse_id, :date, :document1)
    end

    def get_company
      @company = Company.find(params[:receipe][:company_id])
    end

    def get_greenhouse
      @greenhouse = Greenhouse.find(params[:receipe][:greenhouse_id])
    end

    def get_dates_range
      @month_start = params[:receipe][:month_start]
      @month_end = params[:receipe][:month_end]
    end
end
