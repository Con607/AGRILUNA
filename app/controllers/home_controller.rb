class HomeController < ApplicationController
	#skip_before_action :authenticate_user!
	#skip_before_action :check_if_allowed_controller
	#skip_before_action :check_if_allowed_action


  def index
    @mainTitle = "Bienvenido a AgroWeb"
    @mainDesc = "It is an application skeleton for a typical Ruby on Rails web app. You can use it to quickly bootstrap your webapp projects and dev/prod environment."
  end

  def minor
  end
  
end
