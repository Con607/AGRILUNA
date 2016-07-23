#require 'rails_helper'
#
#RSpec.feature "Company", :type => :feature do
#	include Devise::Test::ControllerHelpers
#
#	  scenario "Create a new company" do
#	  	login_with(:user)
#	    visit "/companies/new"
#
#	    fill_in "Name", :with => "My Name"
#	    fill_in "Description", :with => "my@email.com"
#	    fill_in "Address", :with => "34, Allen Way, OA"
#	    fill_in "Telephone", :with => "123456789"
#
#	    click_button "Create Company"
#
#	    expect(page).to have_text("My Name")
#	  end
#end