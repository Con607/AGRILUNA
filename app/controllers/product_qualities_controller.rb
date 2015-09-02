class ProductQualitiesController < ApplicationController
  before_action :set_product_quality, only: [:show, :edit, :update, :destroy]

  # GET /product_qualities
  # GET /product_qualities.json
  def index
    @product_qualities = ProductQuality.all
    @product_quality = ProductQuality.new
  end

  # GET /product_qualities/1
  # GET /product_qualities/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /product_qualities/new
  def new
    @product_quality = ProductQuality.new
  end

  # GET /product_qualities/1/edit
  def edit
  end

  # POST /product_qualities
  # POST /product_qualities.json
  def create
    @product_quality = ProductQuality.new(product_quality_params)

    respond_to do |format|
      if @product_quality.save
        format.js
        format.html { redirect_to @product_quality, notice: 'Product quality was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_quality }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @product_quality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_qualities/1
  # PATCH/PUT /product_qualities/1.json
  def update
    respond_to do |format|
      if @product_quality.update(product_quality_params)
        format.html { redirect_to @product_quality, notice: 'Product quality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_quality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_qualities/1
  # DELETE /product_qualities/1.json
  def destroy
    @product_quality.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to product_qualities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_quality
      @product_quality = ProductQuality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_quality_params
      params.require(:product_quality).permit(:name, :description, :selection_item_ids, :sale_item_ids, :product_id)
    end
end
