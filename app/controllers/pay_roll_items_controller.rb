class PayRollItemsController < ApplicationController
  before_action :set_pay_roll_item, only: [:show, :edit, :update, :destroy, :update_discount, :update_bonus]

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
    @pay_roll_item = PayRollItem.new
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
        format.js
        format.html { redirect_to @pay_roll_item, notice: 'Pay roll item was successfully created.' }
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
        format.html { redirect_to @pay_roll_item, notice: 'Pay roll item was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_roll_item
      @pay_roll_item = PayRollItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_roll_item_params
      params.require(:pay_roll_item).permit(:pay_roll_id, :employee_id, :salary, :discounts, :bonuses, :total, :assistance_ids)
    end


end
