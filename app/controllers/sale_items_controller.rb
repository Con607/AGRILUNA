class SaleItemsController < ApplicationController
  before_action :set_sale_item, only: [:show, :edit, :update, :destroy]
  before_action :set_sale_item_total_price, only: [:update, :create]
  #after_action :get_total_cost, only: [:update, :create]

  # GET /sale_items
  # GET /sale_items.json
  def index
    @sale_items = SaleItem.all
    @sale_item = SaleItem.new
  end

  # GET /sale_items/1
  # GET /sale_items/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /sale_items/new
  def new
    @sale_item = SaleItem.new
  end

  # GET /sale_items/1/edit
  def edit
  end

  # POST /sale_items
  # POST /sale_items.json
  def create
    @sale_item = SaleItem.new(sale_item_params)

    respond_to do |format|
      if @sale_item.save
        get_total_cost
        format.js
        format.html { redirect_to @sale_item, notice: 'Sale item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sale_item }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_items/1
  # PATCH/PUT /sale_items/1.json
  def update
    respond_to do |format|
      if @sale_item.update(sale_item_params)
        format.html { redirect_to @sale_item, notice: 'Sale item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1
  # DELETE /sale_items/1.json
  def destroy
    @sale_item.destroy
    get_total_cost
    respond_to do |format|
      format.js
      format.html { redirect_to sale_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_item_params
      params.require(:sale_item).permit(:sale_id, :product_quality_id, :quantity, :unit_price, :total_price, :status)
    end

    def set_sale_item_total_price
      quantity = params[:sale_item][:quantity].to_f
      unit_price = params[:sale_item][:unit_price].to_f
      params[:sale_item][:total_price] = quantity * unit_price
    end

    def get_total_cost
      sale = @sale_item.sale
      sale.total_price = sale.sale_items.sum(:total_price)
      sale.save
    end

end
