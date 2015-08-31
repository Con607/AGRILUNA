class ApplicationItemsController < ApplicationController
  before_action :set_application_item, only: [:show, :edit, :update, :destroy]
  before_action :get_application_before_destroy, only: [:destroy]
  before_action :set_cost_per_unit, only: [:create]
  after_action :update_application_and_costs, only: [:create, :update]
  after_action :update_application_products, only: [:create, :update]
  after_action :update_application_product_destroy, only: [:destroy]

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
    raise "Cannot create product application, different measure type" if check_measure_type

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

    def set_cost_per_unit
      # We get the cost_per_unit from the application products catalog that has the cost per unit calculated when a product is bought
      application_product = ApplicationProduct.find(params[:application_item][:application_product_id])
      params[:application_item][:cost_per_unit] = application_product.unit_cost
    end

    def check_measure_type
      application_product = ApplicationProduct.find(@application_item.application_product_id)
      unit_type = UnitType.find(@application_item.unit_type_id)
      if application_product.unit_type.measure_type != unit_type.measure_type
        return true
        #puts 'inside check_measure_type!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
        errors.add(:unit_type, "has different measure type than the selected product in inventory")
      end
    end

    def update_application_and_costs
      quantity = @application_item.quantity
      h2o = @application_item.h2o_quantity_liters
      total_product_used = @application_item.total_product_used
      @application_item.quantity = total_product_used / h2o # Get product used per liter of water
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

    def update_application_products
      application_product = @application_item.application_product
      unit_type = @application_item.unit_type
      quantity = @application_item.total_product_used
      converted_quantity = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
      application_product.quantity_available -= converted_quantity
      application_product.save

      # Now update the total_cost
      application_product.total_cost = application_product.unit_cost * application_product.quantity_available
      application_product.save
    end

    def update_application_product_destroy
      application_product = @application_item.application_product
      unit_type = @application_item.unit_type
      quantity = @application_item.total_product_used
      converted_quantity = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
      application_product.quantity_available += converted_quantity
      application_product.save

      # Now update the total_cost
      application_product.total_cost = application_product.unit_cost * application_product.quantity_available
      application_product.save
    end
end