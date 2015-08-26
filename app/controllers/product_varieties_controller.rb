class ProductVarietiesController < ApplicationController
  before_action :set_product_variety, only: [:show, :edit, :update, :destroy]

  # GET /product_varieties
  # GET /product_varieties.json
  def index
    @product_varieties = ProductVariety.all
    @product_variety = ProductVariety.new
  end

  # GET /product_varieties/1
  # GET /product_varieties/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /product_varieties/new
  def new
    @product_variety = ProductVariety.new
  end

  # GET /product_varieties/1/edit
  def edit
  end

  # POST /product_varieties
  # POST /product_varieties.json
  def create
    @product_variety = ProductVariety.new(product_variety_params)

    respond_to do |format|
      if @product_variety.save
        format.js
        format.html { redirect_to @product_variety, notice: 'Product variety was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_variety }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @product_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_varieties/1
  # PATCH/PUT /product_varieties/1.json
  def update
    respond_to do |format|
      if @product_variety.update(product_variety_params)
        format.html { redirect_to @product_variety, notice: 'Product variety was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_varieties/1
  # DELETE /product_varieties/1.json
  def destroy
    @product_variety.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to product_varieties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variety
      @product_variety = ProductVariety.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_variety_params
      params.require(:product_variety).permit(:name, :description, :harvest_ids, :selection_ids, :sale_ids, :product_id)
    end
end
