class PayRollItemsController < ApplicationController
  before_action :set_pay_roll_item, only: [:show, :edit, :update, :destroy]
  before_action :do_calcs, only: [:update]
  before_action :set_unpayed, only: [:destroy]
  after_action :update_pay_roll, only: [:update]
  after_action :set_payed, only: [:create]
  after_action :set_pay_roll_payed, only: [:create, :update]
   

  # GET /pay_roll_items
  # GET /pay_roll_items.json
  def index
    @pay_roll_items = PayRollItem.all
  end

  # GET /pay_roll_items/1
  # GET /pay_roll_items/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /pay_roll_items/new
  def new
    @pay_roll = PayRoll.find(params[:pay_roll_id])
    @pay_roll_item = PayRollItem.new
    @assistances = Assistance.where(assistance_date: @pay_roll.start_date..@pay_roll.end_date).where(
                                        greenhouse_id: @pay_roll.greenhouse_id).where(
                                        pay_roll_item_id: nil)
    @employee_ids = @assistances.where(assisted: true).distinct.pluck(:employee_id)
    @employees = Employee.find(@employee_ids)
  end

  # GET /pay_roll_items/1/edit
  def edit
  end

  # POST /pay_roll_items
  # POST /pay_roll_items.json
  def create
    @pay_roll_item = PayRollItem.new(pay_roll_item_params)

    respond_to do |format|
      if @pay_roll_item.save
        set_total_and_get_assistances
        format.js
        format.html { redirect_to @pay_roll_item.pay_roll, notice: 'Pay roll item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pay_roll_item }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @pay_roll_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_roll_items/1
  # PATCH/PUT /pay_roll_items/1.json
  def update
    respond_to do |format|
      if @pay_roll_item.update(pay_roll_item_params)
        format.js
        format.html { redirect_to @pay_roll_item.pay_roll, notice: 'Pay roll item was successfully updated.' }
        format.json { render json: @pay_roll_item }
      else
        format.js
        format.html { render action: 'edit' }
        format.json { render json: @pay_roll_item.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_roll_items/1
  # DELETE /pay_roll_items/1.json
  def destroy
    @pay_roll_item.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to pay_roll_items_url }
      format.json { head :no_content }
    end
  end

  def set_payed
    @pay_roll_item.assistances.each do |assistance|
      assistance.payed = true
      assistance.save
    end
  end

  def set_unpayed
    @pay_roll_item.assistances.each do |assistance|
      assistance.payed = false
      assistance.save
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
            assistance.payed = #{assistance.payed}
            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
    end
  end

  def set_total_and_get_assistances
    @pay_roll = @pay_roll_item.pay_roll
    employee_id = @pay_roll_item.employee_id
    assistances = Assistance.where(assistance_date: @pay_roll.start_date..@pay_roll.end_date).where(employee_id: employee_id).where(pay_roll_item_id: nil)
    @pay_roll_item.assistances = assistances
    @pay_roll_item.save
    @pay_roll_item.total_assistances = @pay_roll_item.assistances.where(assisted: true).count
    @pay_roll_item.save

    @pay_roll_item.total = ((@pay_roll_item.salary * @pay_roll_item.total_assistances) - @pay_roll_item.discounts) + @pay_roll_item.bonuses
    @pay_roll_item.save

    # Update pay_roll
    @pay_roll.subtotal = (@pay_roll.pay_roll_items.sum(:total) + @pay_roll.pay_roll_items.sum(:discounts)) - @pay_roll.pay_roll_items.sum(:bonuses)
    @pay_roll.discount = @pay_roll.pay_roll_items.sum(:discounts)
    @pay_roll.bonus = @pay_roll.pay_roll_items.sum(:bonuses)
    @pay_roll.total = @pay_roll.pay_roll_items.sum(:total)
    @pay_roll.save
  end

  def do_calcs
    # Update discount
    salary = params[:pay_roll_item][:salary].to_f
    discounts = params[:pay_roll_item][:discounts].to_f
    bonuses = params[:pay_roll_item][:bonuses].to_f
    params[:pay_roll_item][:total] = ((@pay_roll_item.total_assistances * salary) - discounts) + bonuses
  end

  def update_pay_roll
    @pay_roll = @pay_roll_item.pay_roll
        
    # Update pay_roll
    @pay_roll.subtotal = (@pay_roll.pay_roll_items.sum(:total) + @pay_roll.pay_roll_items.sum(:discounts)) - @pay_roll.pay_roll_items.sum(:bonuses)
    @pay_roll.discount = @pay_roll.pay_roll_items.sum(:discounts)
    @pay_roll.bonus = @pay_roll.pay_roll_items.sum(:bonuses)
    @pay_roll.total = @pay_roll.pay_roll_items.sum(:total)
    @pay_roll.save
  end

  def update_discount
    respond_to do |format|
      if @pay_roll_item.update(pay_roll_item_params)
        # Update pay_roll_item
        @pay_roll_item.total = ((@pay_roll_item.salary * @pay_roll_item.total_assistances) - @pay_roll_item.discounts) + @pay_roll_item.bonuses
        @pay_roll_item.save
        @pay_roll = @pay_roll_item.pay_roll
        
        # Update pay_roll
        @pay_roll.subtotal = (@pay_roll.pay_roll_items.sum(:total) + @pay_roll.pay_roll_items.sum(:discounts)) - @pay_roll.pay_roll_items.sum(:bonuses)
        @pay_roll.discount = @pay_roll.pay_roll_items.sum(:discounts)
        @pay_roll.bonus = @pay_roll.pay_roll_items.sum(:bonuses)
        @pay_roll.total = @pay_roll.pay_roll_items.sum(:total)
        @pay_roll.save

        format.html { redirect_to @pay_roll_item, notice: 'Pay roll item was successfully updated.' }
        format.json { render json: {:pay_roll_item => @pay_roll_item, 
                                  :pay_roll => @pay_roll }} 
      else
        format.html { render action: 'edit' }
        format.json { render json: @pay_roll_item.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def update_bonus
    respond_to do |format|
      if @pay_roll_item.update(pay_roll_item_params)
        # Update pay_roll_item
        @pay_roll_item.total = ((@pay_roll_item.salary * @pay_roll_item.total_assistances) - @pay_roll_item.discounts) + @pay_roll_item.bonuses
        @pay_roll_item.save
        @pay_roll = @pay_roll_item.pay_roll
        
        # Update pay_roll
        @pay_roll.subtotal = (@pay_roll.pay_roll_items.sum(:total) + @pay_roll.pay_roll_items.sum(:discounts)) - @pay_roll.pay_roll_items.sum(:bonuses)
        @pay_roll.discount = @pay_roll.pay_roll_items.sum(:discounts)
        @pay_roll.bonus = @pay_roll.pay_roll_items.sum(:bonuses)
        @pay_roll.total = @pay_roll.pay_roll_items.sum(:total)
        @pay_roll.save

        format.html { redirect_to @pay_roll_item, notice: 'Pay roll item was successfully updated.' }
        format.json { render json: {:pay_roll_item => @pay_roll_item, 
                                  :pay_roll => @pay_roll } }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pay_roll_item.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def set_pay_roll_payed
    pay_roll = @pay_roll_item.pay_roll
    all_true = true
    pay_roll.pay_roll_items.each do |pay_roll_item|
      all_true = false if pay_roll_item.payed != true
    end
    if all_true == true
      pay_roll.payed = true
      pay_roll.save
    else
      pay_roll.payed = false
      pay_roll.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_roll_item
      @pay_roll_item = PayRollItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_roll_item_params
      params.require(:pay_roll_item).permit(:pay_roll_id, :employee_id, :payed, :salary, :discounts, :bonuses, :total, :assistance_ids)
    end


end
