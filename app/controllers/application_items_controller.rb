class ApplicationItemsController < ApplicationController
  before_action :set_application_item, only: [:show, :edit, :update, :destroy]
  before_action :get_application_before_destroy, only: [:destroy]
  #after_action :update_application_and_costs, only: [:create, :update]

  # GET /application_items
  # GET /application_items.json
  def index
    @application_items = ApplicationItem.all
  end

  # GET /application_items/1
  # GET /application_items/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /application_items/new
  def new
    @application_item = ApplicationItem.new
    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  # GET /application_items/1/edit
  def edit
  end

  # POST /application_items
  # POST /application_items.json
  def create
    @application_item = ApplicationItem.new(application_item_params)

    respond_to do |format|
      if @application_item.save
        update_application_and_costs
        format.js
        format.html { redirect_to @application_item, notice: 'Application item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @application_item }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @application_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_items/1
  # PATCH/PUT /application_items/1.json
  def update
    respond_to do |format|
      if @application_item.update(application_item_params)
        update_application_and_costs
        format.html { redirect_to @application_item, notice: 'Application item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @application_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_items/1
  # DELETE /application_items/1.json
  def destroy
    @application_item.destroy
    update_application_on_destroy
    respond_to do |format|
      format.js
      format.html { redirect_to application_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_item
      @application_item = ApplicationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_item_params
      params.require(:application_item).permit(:application_id, :application_product_id, :unit_type_id, 
                                          :quantity, :h2o_quantity_liters, :total_product_used, :cost_per_unit, 
                                          :total_cost)
    end

    def update_application_and_costs
      quantity = @application_item.quantity
      h2o = @application_item.h2o_quantity_liters
      @application_item.total_product_used = quantity * h2o # units/Liter
      @application_item.save
      @application_item.total_cost = @application_item.cost_per_unit * @application_item.total_product_used
      @application_item.save
      application = @application_item.application
      application.application_cost = application.application_items.sum(:total_cost)
      application.save
    end

    def get_application_before_destroy
      @application = @application_item.application
    end

    def update_application_on_destroy
      @application.application_cost = @application.application_items.sum(:total_cost)
      @application.save
    end
end
