require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

describe "Companies", js: true do
  DatabaseCleaner.clean

  @companies_module = FactoryGirl.create(:permission, value: "companies")
  @companies_index = FactoryGirl.create(:permission, value: "user_companies/index")
  @companies_create = FactoryGirl.create(:permission, value: "user_companies/create")
  @companies_new = FactoryGirl.create(:permission, value: "user_companies/new")
  @companies_show = FactoryGirl.create(:permission, value: "user_companies/show")

  @role_companies = FactoryGirl.create(:role, permissions: [@companies_module, @companies_index,
                                                              @companies_create, @companies_new, @companies_show])
	user = FactoryGirl.create(:user, roles: [@role_companies])
	login_as(user, :scope => :user)

  describe "Manage companies" do
    it "Adds a new company and displays the results" do
      visit companies_url
      expect{
        click_link 'New Company'
        fill_in 'Name', with: "Jhon"
        fill_in 'Description', with: "Smith"
        fill_in 'Address', with: "Valladolid 434 Centro"
        fill_in 'Telephone', with: "5553324"
        click_button "Create Company"
      }.to change(Company,:count).by(1)
      page.should have_content "Company was successfully created."
      #within 'h1' do
       # page.should have_content "John"
      #end
      page.should have_content "Jhon"
      page.should have_content "Smith"
      page.should have_content "5553324"
      page.should have_content "Valladolid 434 Centro"
    end
  end
end
