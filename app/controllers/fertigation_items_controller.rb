class FertigationItemsController < ApplicationController
  before_action :set_fertigation_item, only: [:show, :edit, :update, :destroy]
  before_action :check_if_product_is_available, only: [:create, :update]
  before_action :get_fertigation_before_destroy, only: [:destroy]
  before_action :set_cost_per_unit, only: [:create]
  after_action :update_fertigation_and_costs, only: [:create, :update]
  after_action :update_application_products, only: [:create, :update]
  after_action :update_application_product_destroy, only: [:destroy]

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
    raise "Cannot create product application, different measure type" if check_measure_type

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
    #update_fertigation_on_destroy
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
      params.require(:fertigation_item).permit(:fertigation_id, :application_product_id, :unit_type_id, :fertilizer_quantity,
                                   :concentration, :injection_rate, :fertilizer_cost_per_unit, :cost)
    end

    def check_measure_type
      application_product = ApplicationProduct.find(@fertigation_item.application_product_id)
      unit_type = UnitType.find(@fertigation_item.unit_type_id)
      if application_product.unit_type.measure_type != unit_type.measure_type
        return true
        #puts 'inside check_measure_type!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
        errors.add(:unit_type, "has different measure type than the selected product in inventory")
      end
    end

    def check_if_product_is_available
      quantity = params[:fertigation_item][:fertilizer_quantity].to_f
      fertigation = Fertigation.find(params[:fertigation_item][:fertigation_id])
      h2o_quantity_liters = fertigation.h2o_quantity
      application_product = ApplicationProduct.find(params[:fertigation_item][:application_product_id])
      unit_type = UnitType.find(params[:fertigation_item][:unit_type_id])
      converted_quantity = unit_type.convert_to((quantity * h2o_quantity_liters), application_product.unit_type.abbreviation)
      puts "!!!!!!!!!!!!!!!!!!1 
      converted_quantity = #{converted_quantity}, application_product.quantity_available = #{application_product.quantity_available}
      !!!!!!!!!!!!!!!!!!!!!!!!!"
      if converted_quantity > application_product.quantity_available 
        redirect_to fertigation_path(params[:fertigation_item][:fertigation_id]), notice: 'Not enough quantity available of selected product.'
      end
    end

    def set_cost_per_unit
      # We get the cost_per_unit from the application products catalog that has the cost per unit calculated when a product is bought
      application_product = ApplicationProduct.find(params[:fertigation_item][:application_product_id])
      params[:fertigation_item][:fertilizer_cost_per_unit] = application_product.unit_cost
    end

    def update_fertigation_and_costs
      application_product = @fertigation_item.application_product
      quantity = @fertigation_item.fertilizer_quantity # fertilizer_quantity means quantity of fertilizer in gr or L
      h2o = @fertigation_item.fertigation.h2o_quantity
      unit_type = @fertigation_item.unit_type
      
      # Convert quantity to gr to get the concentration in gr/ml
      # convert_to = 'ml' if unit_type.measure_type == 'Volume'
      # convert_to = 'gr' if unit_type.measure_type == 'Weight'

      #quantity_in_gr = unit_type.convert_to(quantity, convert_to)
      @fertigation_item.concentration = quantity / h2o
      
      # Now we get the cost of the fertigation_item, we convert the units first to match the product aplication unit type and get the true cost
      quantity_in_product_units = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
      @fertigation_item.cost = @fertigation_item.fertilizer_cost_per_unit * quantity_in_product_units
      @fertigation_item.save

      # Now we update the fertigation
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

    def update_application_products
      application_product = @fertigation_item.application_product
      unit_type = @fertigation_item.unit_type
      quantity = @fertigation_item.fertilizer_quantity
      converted_quantity = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
      application_product.quantity_available -= converted_quantity
      application_product.save

      # Now update the total_cost
      application_product.total_cost = application_product.unit_cost * application_product.quantity_available
      application_product.save
    end

    def update_application_product_destroy
      application_product = @fertigation_item.application_product
      unit_type = @fertigation_item.unit_type
      quantity = @fertigation_item.fertilizer_quantity
      converted_quantity = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
      application_product.quantity_available += converted_quantity
      application_product.save

      # Now update the total_cost
      application_product.total_cost = application_product.unit_cost * application_product.quantity_available
      application_product.save
    end

end
