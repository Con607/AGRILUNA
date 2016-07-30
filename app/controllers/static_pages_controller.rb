class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!
	skip_before_action :check_if_allowed_controller
	skip_before_action :check_if_allowed_action

	layout 'static_pages'

 	def index
 	end
end
