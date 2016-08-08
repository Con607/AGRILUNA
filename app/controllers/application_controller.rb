class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_if_allowed_controller, if: :user_signed_in?
  before_action :check_if_allowed_action, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user_plan, if: :user_signed_in?


  helper_method :is_allowed?


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :second_lat_name, :account_id])
  	end

    def check_if_allowed_controller
      if is_allowed?(params[:controller]) != true
        redirect_to root_path, notice: (t :not_enough_permissions)
      end
    end

    def check_if_allowed_action
      ### Debugging line ###
      puts "checking.....  controller = #{params[:controller]}, action = #{params[:action]}, #{params[:controller]}/#{params[:action]}"
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

    def after_sign_in_path_for(resource)
        if resource.is_a?(User) && resource.account.plan.nil?
          '/steps/first'
        else
          super
        end
    end

    # The path used after sign up for inactive accounts.
    #def after_inactive_sign_up_path_for(resource)
    #  puts "Im inside after_inactive_sign_up_path_for"
    #  companies_path
    #end

    # The path used after sign up.
    #def after_sign_up_path_for(resource)
    #  companies_path
    #end

    def check_user_plan
      if current_user.account.plan.nil?
        redirect_to '/steps/first'
      end
    end

end
