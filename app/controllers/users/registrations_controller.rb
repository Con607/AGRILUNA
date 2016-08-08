class Users::RegistrationsController < Devise::RegistrationsController
 before_filter :configure_sign_up_params, only: [:create]
 before_filter :configure_account_update_params, only: [:update]

 layout 'log_in'

  # List all users
  def index
    @users = User.all
  end

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
     super
     #puts "Im inside create action for regitrations controller"
   end

  # GET /resource/edit
   def edit
     #super
    # @user = User.find(params[:id])
    #if @user.update_attributes(secure_params)
    #  redirect_to users_path, :notice => "User updated."
    #else
    #  redirect_to users_path, :alert => "Unable to update user."
    #end
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

   #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     #devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :second_last_name]
     #devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :second_lat_name])
   end

   #If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     #devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :second_last_name]
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :second_lat_name, :account_id])
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource) 
     '/steps/first'
   end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
      puts "Im inside after_inactive_sign_up_path_for"
      '/steps/first'
   end

end
