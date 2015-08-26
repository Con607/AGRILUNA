class ProductPresentationsController < ApplicationController
  before_action :set_product_presentation, only: [:show, :edit, :update, :destroy]

  # GET /product_presentations
  # GET /product_presentations.json
  def index
    @product_presentations = ProductPresentation.all
    @product_presentation = ProductPresentation.new
  end

  # GET /product_presentations/1
  # GET /product_presentations/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /product_presentations/new
  def new
    @product_presentation = ProductPresentation.new
  end

  # GET /product_presentations/1/edit
  def edit
  end

  # POST /product_presentations
  # POST /product_presentations.json
  def create
    @product_presentation = ProductPresentation.new(product_presentation_params)

    respond_to do |format|
      if @product_presentation.save
        format.js
        format.html { redirect_to @product_presentation, notice: 'Product presentation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_presentation }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @product_presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_presentations/1
  # PATCH/PUT /product_presentations/1.json
  def update
    respond_to do |format|
      if @product_presentation.update(product_presentation_params)
        format.html { redirect_to @product_presentation, notice: 'Product presentation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_presentations/1
  # DELETE /product_presentations/1.json
  def destroy
    @product_presentation.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to product_presentations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_presentation
      @product_presentation = ProductPresentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_presentation_params
      params.require(:product_presentation).permit(:name, :description, :harvest_ids, :selection_ids, :sale_ids, :product_id, :unit_type_id, :quantity)
    end
end
