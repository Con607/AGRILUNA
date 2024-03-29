class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
    @sale = Sale.new
    if params[:search]
      company_id = params[:search][:company_id]
      greenhouse_id = params[:search][:greenhouse_id]
      @show_sales = true
      @greenhouse = Greenhouse.find(greenhouse_id)
      @cycle = Cycle.where(greenhouse_id: greenhouse_id).active.first
      from_date = @cycle.start_date
      to_date = @cycle.end_date
      @sales = Sale.where(greenhouse_id: greenhouse_id).where(event_date: from_date..to_date).order(:event_date)
      @sale = Sale.new
    else
      @show_sales == false
      @companies = current_user.companies
      @greenhouses = Greenhouse.where(company_id: @companies.first.id..@companies.last.id)
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale_items = @sale.sale_items
    @sale_item = SaleItem.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.js
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sale }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:event_date, :product_id, :product_variety_id, :product_presentation_id, 
        :total_price, :status, :greenhouse_id, :sale_item_ids)
    end
end
