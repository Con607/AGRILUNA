class SelectionItemsController < ApplicationController
  before_action :set_selection_item, only: [:show, :edit, :update, :destroy]
  #after_action :get_total_weight, only: [:update, :create]

  # GET /selection_items
  # GET /selection_items.json
  def index
    @selection_items = SelectionItem.all
    @selection_item = SelectionItem.new
  end

  # GET /selection_items/1
  # GET /selection_items/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /selection_items/new
  def new
    @selection_item = SelectionItem.new
  end

  # GET /selection_items/1/edit
  def edit
  end

  # POST /selection_items
  # POST /selection_items.json
  def create
    @selection_item = SelectionItem.new(selection_item_params)

    respond_to do |format|
      if @selection_item.save
        get_total_weight
        format.js
        format.html { redirect_to @selection_item, notice: 'Selection item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @selection_item }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @selection_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selection_items/1
  # PATCH/PUT /selection_items/1.json
  def update
    respond_to do |format|
      if @selection_item.update(selection_item_params)
        format.html { redirect_to @selection_item, notice: 'Selection item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @selection_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_items/1
  # DELETE /selection_items/1.json
  def destroy
    get_selection_on_destroy
    @selection_item.destroy
    get_total_weight
    respond_to do |format|
      format.js
      format.html { redirect_to selection_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection_item
      @selection_item = SelectionItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_item_params
      params.require(:selection_item).permit(:selection_id, :product_quality_id, :quantity)
    end

    def get_selection_on_destroy
      @selection = @selection_item.selection
    end

    def get_total_weight
      if @selection.nil?
        @selection = @selection_item.selection
      end
      @selection.total_weight = @selection.selection_items.sum(:quantity) * @selection.product_presentation.quantity
      @selection.save
    end

end
