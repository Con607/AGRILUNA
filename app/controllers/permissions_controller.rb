class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all
    @permission = Permission.new
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.js
        format.html { redirect_to @permission, notice: 'Permission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @permission }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to @permission, notice: 'Permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to permissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:role_permission_ids, :name, :description, :value)
    end
end
