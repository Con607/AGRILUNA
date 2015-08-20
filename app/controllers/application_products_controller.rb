class ApplicationProductsController < ApplicationController
  before_action :set_application_product, only: [:show, :edit, :update, :destroy]

  # GET /application_products
  # GET /application_products.json
  def index
    @application_products = ApplicationProduct.all
    @application_product = ApplicationProduct.new
  end

  # GET /application_products/1
  # GET /application_products/1.json
  def show
  end

  # GET /application_products/new
  def new
    @application_product = ApplicationProduct.new
    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  # GET /application_products/1/edit
  def edit
  end

  # POST /application_products
  # POST /application_products.json
  def create
    @application_product = ApplicationProduct.new(application_product_params)

    respond_to do |format|
      if @application_product.save
        format.js
        format.html { redirect_to @application_product, notice: 'Application product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @application_product }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @application_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_products/1
  # PATCH/PUT /application_products/1.json
  def update
    respond_to do |format|
      if @application_product.update(application_product_params)
        format.html { redirect_to @application_product, notice: 'Application product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @application_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_products/1
  # DELETE /application_products/1.json
  def destroy
    @application_product.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to application_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_product
      @application_product = ApplicationProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_product_params
      params.require(:application_product).permit(:application_item_ids, :name, :description, :quantity_available, :units_of_measure)
    end
end
