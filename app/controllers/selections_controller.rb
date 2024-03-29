class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]

  # GET /selections
  # GET /selections.json
  def index
    if params[:search]
      company_id = params[:search][:company_id]
      greenhouse_id = params[:search][:greenhouse_id]
      @show_selections = true
      @greenhouse = Greenhouse.find(greenhouse_id)
      @cycle = Cycle.where(greenhouse_id: greenhouse_id).active.first
      from_date = @cycle.start_date
      to_date = @cycle.end_date
      @selections = Selection.where(greenhouse_id: greenhouse_id).where(event_date: from_date..to_date).order(:event_date)
      @selection = Selection.new
    else
      @show_selections == false
      @companies = current_user.companies
      @greenhouses = Greenhouse.where(company_id: @companies.first.id..@companies.last.id)
    end
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
    @selection_items = @selection.selection_items
    @selection_item = SelectionItem.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /selections/new
  def new
    @selection = Selection.new
  end

  # GET /selections/1/edit
  def edit
  end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(selection_params)

    respond_to do |format|
      if @selection.save
        format.js
        format.html { redirect_to @selection, notice: 'Selection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @selection }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selections/1
  # PATCH/PUT /selections/1.json
  def update
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to @selection, notice: 'Selection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to selections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_params
      params.require(:selection).permit(:event_date, :greenhouse_id, :product_id, :product_variety_id, :product_presentation_id, 
        :total_weight, :selection_item_ids)
    end

end
