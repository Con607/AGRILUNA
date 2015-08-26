class FertigationItemsController < ApplicationController
  before_action :set_fertigation_item, only: [:show, :edit, :update, :destroy]
  before_action :get_fertigation_before_destroy, only: [:destroy]

  # GET /fertigation_items
  # GET /fertigation_items.json
  def index
    @fertigation_items = FertigationItem.all
    @fertigation_item = FertigationItem.new
  end

  # GET /fertigation_items/1
  # GET /fertigation_items/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /fertigation_items/new
  def new
    @fertigation_item = FertigationItem.new
    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  # GET /fertigation_items/1/edit
  def edit
  end

  # POST /fertigation_items
  # POST /fertigation_items.json
  def create
    @fertigation_item = FertigationItem.new(fertigation_item_params)

    respond_to do |format|
      if @fertigation_item.save
        update_fertigation_and_costs
        format.js
        format.html { redirect_to @fertigation_item, notice: 'Fertigation item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fertigation_item }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @fertigation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fertigation_items/1
  # PATCH/PUT /fertigation_items/1.json
  def update
    respond_to do |format|
      if @fertigation_item.update(fertigation_item_params)
        update_fertigation_and_costs
        format.html { redirect_to @fertigation_item, notice: 'Fertigation item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fertigation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fertigation_items/1
  # DELETE /fertigation_items/1.json
  def destroy
    @fertigation_item.destroy
    update_fertigation_on_destroy
    respond_to do |format|
      format.js
      format.html { redirect_to fertigation_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fertigation_item
      @fertigation_item = FertigationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fertigation_item_params
      params.require(:fertigation_item).permit(:fertigation_id, :application_product_id, :unit_measure, :fertilizer_quantity, :h20_quantity, :concentration, :injection_rate, :fertilizer_cost_per_unit, :cost)
    end

    def update_fertigation_and_costs
      @fertigation_item.concentration = @fertigation_item.fertilizer_quantity * @fertigation_item.h20_quantity
      @fertigation_item.save
      # Injection rate pendant
      #@fertigation_item.injection_rate
      @fertigation_item.cost = @fertigation_item.fertilizer_cost_per_unit * @fertigation_item.fertilizer_quantity
      @fertigation_item.save
      
      fertigation = @fertigation_item.fertigation
      fertigation.total_cost = fertigation.fertigation_items.sum(:cost)
      fertigation.save
    end

    def get_fertigation_before_destroy
      @fertigation = @fertigation_item.fertigation
    end

    def update_fertigation_on_destroy
      @fertigation.total_cost = @fertigation.fertigation_items.sum(:cost)
      @fertigation.save
    end

end
