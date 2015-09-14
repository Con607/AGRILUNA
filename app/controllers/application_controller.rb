class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #before_action :check_if_allowed_controller, if: :user_signed_in?
  #efore_action :check_if_allowed_action, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :is_allowed?


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  	def configure_permitted_parameters
  	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :second_lat_name)}
  	end

    def check_if_allowed_controller
      if is_allowed?(params[:controller]) != true
        redirect_to root_path, notice: (t :not_enough_permissions)
      end
    end

    def check_if_allowed_action
       if is_allowed?("#{params[:controller]}/#{params[:action]}") != true
        redirect_to root_path, notice: (t :not_enough_permissions)
       end
    end

  	def is_allowed?(permission)
  		if user_signed_in?
  			current_user.roles.each do |user_role|
  			  user_role.permissions.each do |user_permission|
  			    if user_permission.value == permission
  			      return true
  			    end
  			  end
  			end
  		else
  			return false
  		end
  	end

end
