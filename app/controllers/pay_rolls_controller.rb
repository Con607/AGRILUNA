class PayRollsController < ApplicationController
  before_action :set_pay_roll, only: [:show, :edit, :update, :destroy]
  before_action :set_unpayed, only: [:destroy]
  #after_action :get_assistances, only: [:create]

  # GET /pay_rolls
  # GET /pay_rolls.json
  def index
    @pay_rolls = PayRoll.all

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  # GET /pay_rolls/1
  # GET /pay_rolls/1.json
  def show
    @pay_roll_items = @pay_roll.pay_roll_items
    @new_pay_roll_item = PayRollItem.new
    @assistances = Assistance.where(assistance_date: @pay_roll.start_date..@pay_roll.end_date).where(
                                        greenhouse_id: @pay_roll.greenhouse_id).where(
                                        pay_roll_item_id: nil)
    @employee_ids = @assistances.where(assisted: true).distinct.pluck(:employee_id)
    @employees = Employee.find(@employee_ids)

    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  # GET /pay_rolls/new
  def new
    @pay_roll = PayRoll.new
  end

  # GET /pay_rolls/1/edit
  def edit
  end

  # POST /pay_rolls
  # POST /pay_rolls.json
  def create
    @pay_roll = PayRoll.new(pay_roll_params)

    respond_to do |format|
      if @pay_roll.save
        format.html { redirect_to @pay_roll, notice: 'Pay roll was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pay_roll }
      else
        format.html { render action: 'new' }
        format.json { render json: @pay_roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_rolls/1
  # PATCH/PUT /pay_rolls/1.json
  def update
    respond_to do |format|
      if @pay_roll.update(pay_roll_params)
        format.html { redirect_to @pay_roll, notice: 'Pay roll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pay_roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_rolls/1
  # DELETE /pay_rolls/1.json
  def destroy
    @pay_roll.destroy
    respond_to do |format|
      format.html { redirect_to pay_rolls_url }
      format.json { head :no_content }
    end
  end

  def discount_update_form
    @pay_roll_item = PayRollItem.new

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_roll
      @pay_roll = PayRoll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_roll_params
      params.require(:pay_roll).permit(:pay_roll_item_id, :start_date, :end_date, :greenhouse_id, 
                  :subtotal, :discount, :bonus, :total, :total_assistances)
    end

    def set_unpayed
      @pay_roll.pay_roll_items.each do |pay_roll_item|
        pay_roll_item.assistances.each do |assistance|
          assistance.payed = false
          assistance.save
          puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
                assistance.payed = #{assistance.payed}
                !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
        end
      end
    end



    # Get assistances on a given range of dates
    def get_assistances
      assistances = Assistance.where(assistance_date: @pay_roll.start_date..@pay_roll.end_date).where(pay_roll_item_id: nil).order(:employee_id)
      employee_ids = assistances.select(:employee_id).distinct
      employee_ids.each do |employee_id|
        puts "!!!!!!!!!!!!!!!!!!! employee_id = #{employee_id.employee_id}"
        pay_roll_item = PayRollItem.new
        #pay_roll_item.save
        employee = employee_id.employee
        pay_roll_item.employee = employee
        pay_roll_item.assistances = employee.assistances.where(payed: [false, nil]).where(assistance_date: @pay_roll.start_date..@pay_roll.end_date).where(pay_roll_item_id: nil)
        pay_roll_item.save
        pay_roll_item.total_assistances = pay_roll_item.assistances.where(assisted: true).count
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        pay_roll_item.assistances = #{employee.assistances.where(payed: [false, nil]).where(assistance_date: @pay_roll.start_date..@pay_roll.end_date).where(pay_roll_item_id: nil)}
        pay_roll_item.total_assistances = #{pay_roll_item.assistances.where(assisted: true).where("payed != ?", true).count}
        employee = #{employee_id.employee.first_name}
        pay_roll_item.employee = #{pay_roll_item.employee.first_name}
        pay_roll_item.assistances.count = #{pay_roll_item.assistances.count}
        employee.assistances.count = #{employee.assistances.count}
        pay_roll_item.assistances.count = #{pay_roll_item.assistances.count}
          
          pay_roll_item.assistances.where(assisted: true).count = #{pay_roll_item.assistances.where(assisted: true).count}
          pay_roll_item.assistances = #{pay_roll_item.assistances.count}
          pay_roll_item.total_assistances = #{pay_roll_item.total_assistances}
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        pay_roll_item.salary = employee.salary
        pay_roll_item.discounts = 0.0
        pay_roll_item.bonuses = 0.0
        pay_roll_item.save
        pay_roll_item.total = ((pay_roll_item.salary * pay_roll_item.total_assistances) - pay_roll_item.discounts) + pay_roll_item.bonuses
        pay_roll_item.save
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!
              pay_roll_item.total_assistances = #{pay_roll_item.total_assistances}
              pay_roll_item.salary = #{pay_roll_item.salary}
              pay_roll_item.discounts = #{pay_roll_item.discounts}
              pay_roll_item.bonuses = #{pay_roll_item.bonuses}
              pay_roll_item.total = ((#{pay_roll_item.salary} * #{pay_roll_item.total_assistances}) - #{pay_roll_item.discounts}) + #{pay_roll_item.bonuses}
              !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        @pay_roll.pay_roll_items << pay_roll_item
        @pay_roll.save
      end

      @pay_roll.subtotal = (@pay_roll.pay_roll_items.sum(:total) + @pay_roll.pay_roll_items.sum(:discounts)) - @pay_roll.pay_roll_items.sum(:bonuses)
      @pay_roll.discount = @pay_roll.pay_roll_items.sum(:discounts)
      @pay_roll.bonus = @pay_roll.pay_roll_items.sum(:bonuses)
      @pay_roll.total = @pay_roll.pay_roll_items.sum(:total)
      @pay_roll.save
    end
end
