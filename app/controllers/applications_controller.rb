class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :update_application_product_destroy, only: [:destroy]

  # GET /applications
  # GET /applications.json
  def index
    if params[:search]
      company_id = params[:search][:company_id]
      greenhouse_id = params[:search][:greenhouse_id]
      @show_applications = true
      @greenhouse = Greenhouse.find(greenhouse_id)
      @cycle = Cycle.where(greenhouse_id: greenhouse_id).active.first
      from_date = @cycle.start_date
      to_date = @cycle.end_date
      @applications = Application.where(greenhouse_id: greenhouse_id).where(application_date: from_date..to_date).order(:application_date)
      @application = Application.new
    else
      @show_applications == false
      @companies = current_user.companies
      @greenhouses = Greenhouse.where(company_id: @companies.first.id..@companies.last.id)
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application_item = ApplicationItem.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /applications/new
  def new
    @application = Application.new
    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.js
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render action: 'show', status: :created, location: @application }
      else
        format.html { render action: 'new' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.js
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:application_date, :application_process_id, :purpose, :greenhouse_id, 
                  :application_cost, :application_item_ids => [])
    end

    def update_application_product_destroy
      @application.application_items.each do |application_item|
        application_product = @application_item.application_product
        unit_type = application_item.unit_type
        quantity = application_item.total_product_used
        converted_quantity = unit_type.convert_to(quantity, application_product.unit_type.abbreviation)
        application_product.quantity_available += converted_quantity
        application_product.save

        # Now update the total_cost
        application_product.total_cost = application_product.unit_cost * application_product.quantity_available
        application_product.save
      end
    end

end
