class ManageUsersController < ApplicationController
	before_action :set_user, only: [:show_user, :edit_user, :update_user]

	def index
		@users = User.all
	end

	def edit_user
	end

	def show_user
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /sales/new
  def new_user
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create_user
    @user = User.new(user_params)

	respond_to do |format|
	 if @user.save
	   format.js
	   format.html { redirect_to users_list_path, notice: 'User was successfully created.' }
	   format.json { render action: 'users_list', status: :created, location: @user }
	 else
	   format.js
	   format.html { render action: 'new_user' }
	   format.json { render json: @user.errors, status: :unprocessable_entity }
	 end
	end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_list_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit_user' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :second_last_name, :email, 
                                    :password, :password_confirmation, :confirmable)
    end

end