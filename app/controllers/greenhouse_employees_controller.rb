class GreenhouseEmployeesController < ApplicationController
  before_action :set_greenhouse_employee, only: [:show, :edit, :update, :destroy]

  # GET /greenhouse_employees
  # GET /greenhouse_employees.json
  def index
    @greenhouse_employees = GreenhouseEmployee.all
  end

  # GET /greenhouse_employees/1
  # GET /greenhouse_employees/1.json
  def show
  end

  # GET /greenhouse_employees/new
  def new
    @greenhouse_employee = GreenhouseEmployee.new
  end

  # GET /greenhouse_employees/1/edit
  def edit
  end

  # POST /greenhouse_employees
  # POST /greenhouse_employees.json
  def create
    @greenhouse_employee = GreenhouseEmployee.new(greenhouse_employee_params)

    respond_to do |format|
      if @greenhouse_employee.save
        format.html { redirect_to @greenhouse_employee, notice: 'Greenhouse employee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @greenhouse_employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @greenhouse_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greenhouse_employees/1
  # PATCH/PUT /greenhouse_employees/1.json
  def update
    respond_to do |format|
      if @greenhouse_employee.update(greenhouse_employee_params)
        format.html { redirect_to @greenhouse_employee, notice: 'Greenhouse employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @greenhouse_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greenhouse_employees/1
  # DELETE /greenhouse_employees/1.json
  def destroy
    @greenhouse_employee.destroy
    respond_to do |format|
      format.html { redirect_to greenhouse_employees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greenhouse_employee
      @greenhouse_employee = GreenhouseEmployee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def greenhouse_employee_params
      params.require(:greenhouse_employee).permit(:greenhouse_id, :employee_id)
    end
end
