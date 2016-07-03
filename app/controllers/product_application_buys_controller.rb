class ProductApplicationBuysController < ApplicationController
  before_action :set_product_application_buy, only: [:show, :edit, :update, :destroy]
  before_action :set_unit_cost, only: [:create, :update]
  after_action :update_application_product, only: [:create, :update]
  after_action :update_application_product_destroy, only: [:destroy]

  # GET /product_application_buys
  # GET /product_application_buys.json
  def index
    if params[:search]
      @current_company = Company.find(params[:search][:company_id])
      @companies = current_user.companies
      @month_start = Date.civil(params[:search]["month_start(1i)"].to_i,
                                params[:search]["month_start(2i)"].to_i,
                                params[:search]["month_start(3i)"].to_i)
      @month_end = Date.civil(params[:search]["month_end(1i)"].to_i,
                                params[:search]["month_end(2i)"].to_i,
                                params[:search]["month_end(3i)"].to_i)
      @product_application_buys = ProductApplicationBuy.where(company_id: @current_company.id
                                                  ).where(buy_date: @month_start..@month_end
                                                  ).order(:buy_date)
      @product_application_buy = ProductApplicationBuy.new
      @application_products = ApplicationProduct.order(:name)
      @show_product_application_buys = true
    else
      @companies = current_user.companies
      @show_product_application_buys = false
    end
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
    #raise "Cannot create product application buy, not enough product available." if check_if_product_is_available == true

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
    #raise "Cannot create product application buy, not enough product available." if check_if_product_is_available == true 
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
      params.require(:product_application_buy).permit(:buy_date, :application_product_id, :quanity, 
                                                        :unit_cost, :total_cost, :supplier_id, :unit_type_id, :image1, :company_id)
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
      converted_quantity = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
      application_product.quantity_available += converted_quantity
      application_product.save

      # Now update the total_cost
      application_product.total_cost += @product_application_buy.total_cost
      application_product.save
      application_product.unit_cost = application_product.total_cost / application_product.quantity_available
      application_product.save
    end

    def update_application_product_destroy
      application_product = @product_application_buy.application_product
      unit_type = @product_application_buy.unit_type
      quantity = @product_application_buy.quanity
      converted_quantity = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
      application_product.quantity_available -= converted_quantity
      application_product.save

      if application_product.quantity_available = 0.0
        application_product.total_cost = 0.0
        application_product.unit_cost = 0.0
        application_product.save
      else
        # Now update the total_cost
        application_product.total_cost -= @product_application_buy.total_cost
        application_product.save
        application_product.unit_cost = application_product.total_cost / application_product.quantity_available
        application_product.save
      end
    end

end
