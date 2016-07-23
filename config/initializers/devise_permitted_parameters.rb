module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :name
    #devise_parameter_sanitizer.for(:account_update) << :name
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :second_lat_name])
      																#:phone, :email, bank_attributes: [:bank_name, :bank_account]])
    end
  end

end

DeviseController.send :include, DevisePermittedParameters
