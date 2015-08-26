class ProductApplicationBuysController < ApplicationController
  before_action :set_product_application_buy, only: [:show, :edit, :update, :destroy]
  before_action :set_unit_cost, only: [:create, :update]
  after_action :update_application_product, only: [:create, :update]
  after_action :update_application_product_destroy, only: [:destroy]

  # GET /product_application_buys
  # GET /product_application_buys.json
  def index
    @product_application_buys = ProductApplicationBuy.all
    @product_application_buy = ProductApplicationBuy.new
  end

  # GET /product_application_buys/1
  # GET /product_application_buys/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /product_application_buys/new
  def new
    @product_application_buy = ProductApplicationBuy.new
  end

  # GET /product_application_buys/1/edit
  def edit
  end

  # POST /product_application_buys
  # POST /product_application_buys.json
  def create
    @product_application_buy = ProductApplicationBuy.new(product_application_buy_params)
    raise "Cannot create product application buy, different measure type" if check_measure_type

    respond_to do |format|
      if @product_application_buy.save
        format.js
        format.html { redirect_to @product_application_buy, notice: 'Product application buy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_application_buy }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @product_application_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_application_buys/1
  # PATCH/PUT /product_application_buys/1.json
  def update
    respond_to do |format|
      if @product_application_buy.update(product_application_buy_params)
        format.html { redirect_to @product_application_buy, notice: 'Product application buy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_application_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_application_buys/1
  # DELETE /product_application_buys/1.json
  def destroy
    @product_application_buy.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to product_application_buys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_application_buy
      @product_application_buy = ProductApplicationBuy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_application_buy_params
      params.require(:product_application_buy).permit(:greenhouse_id, :buy_date, :application_product_id, :unit, :quanity, 
                                                        :unit_cost, :total_cost, :supplier_id, :unit_type_id)
    end

    def set_unit_cost
      total_cost = params[:product_application_buy][:total_cost].to_f
      quanity = params[:product_application_buy][:quanity].to_f
      params[:product_application_buy][:unit_cost] = total_cost / quanity
    end

    def check_measure_type
      application_product = ApplicationProduct.find(@product_application_buy.application_product_id)
      unit_type = UnitType.find(@product_application_buy.unit_type_id)
      if application_product.unit_type.measure_type != unit_type.measure_type
        return true
        #puts 'inside check_measure_type!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
        errors.add(:unit_type, "has different measure type than the selected product in inventory")
      end
    end

    def update_application_product
      application_product = @product_application_buy.application_product
      unit_type = @product_application_buy.unit_type
      quantity = @product_application_buy.quanity
      product_unit_type_id = application_product.unit_type.id
      product_unit_type_value = application_product.unit_type.value
      unit_type_id = unit_type.id
      unit_type_value = unit_type.value
      # Check if unit_type is different 
      if product_unit_type_id != unit_type_id
        # The divider and multiplier change
        if product_unit_type_value < 1
          divider = product_unit_type_value / 10
          multiplier = unit_type_value
          application_product.quantity_available += ((quantity * multiplier) / divider)
        else
          divider =  product_unit_type_value
          multiplier = unit_type_value
          application_product.quantity_available += ((quantity * multiplier) / divider)
        end
        application_product.save
      end
      if application_product.unit_type.id == unit_type.id
        application_product.quantity_available += quantity
        application_product.save
      end 
    end

    def update_application_product_destroy
      application_product = @product_application_buy.application_product
      unit_type = @product_application_buy.unit_type
      quantity = @product_application_buy.quanity
      product_unit_type_id = application_product.unit_type.id
      product_unit_type_value = application_product.unit_type.value
      unit_type_id = unit_type.id
      unit_type_value = unit_type.value
      # Check if unit_type is different 
      if product_unit_type_id != unit_type_id
        # The divider and multiplier change
        if product_unit_type_value < 1
          divider = product_unit_type_value / 10
          multiplier = unit_type_value
          application_product.quantity_available -= ((quantity * multiplier) / divider)
        else
          divider =  product_unit_type_value
          multiplier = unit_type_value
          application_product.quantity_available -= ((quantity * multiplier) / divider)
        end
        application_product.save
      end
      if application_product.unit_type.id == unit_type.id
        application_product.quantity_available -= quantity
        application_product.save
      end 
    end

end
