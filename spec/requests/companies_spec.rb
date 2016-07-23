require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

describe "Companies" do
  
  before :each do
    DatabaseCleaner.clean
    @companies_module = FactoryGirl.create(:permission, value: "companies")
    @companies_index = FactoryGirl.create(:permission, value: "user_companies/index")
    @companies_create = FactoryGirl.create(:permission, value: "user_companies/create")
    @companies_new = FactoryGirl.create(:permission, value: "user_companies/new")
    @companies_show = FactoryGirl.create(:permission, value: "user_companies/show")

    @role_companies = FactoryGirl.create(:role, permissions: [@companies_module, @companies_index,
                                                                @companies_create, @companies_new, @companies_show])
    @user = FactoryGirl.create(:user, roles: [@role_companies])
    login_as(@user, :scope => :user)
  end
  

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

    it "Updates a company and displays the results" do
      company = FactoryGirl.create(:company, name: "Cristina", description: "Sumner", users: [@user])
      visit companies_url
      within "#company_#{company.id}" do
        click_link 'Edit'
      end
      current_path.should == edit_company_path(company)
      page.should have_content "Editing Company"
      fill_in 'Name', with: "Sue"
      click_button "Update Company" 
      page.should have_content "Company was successfully updated."
      page.should have_content "Sue"
    end

    it "Deletes a company" do
      company = FactoryGirl.create(:company, name: "Aaron", description: "Sumner", users: [@user])
      visit companies_path
      expect{
        within "#company_#{company.id}" do
          click_link 'Destroy'
        end
        #alert = page.driver.browser.switch_to.alert
        #alert.accept
      }.to change(Company,:count).by(-1)
      page.should have_content "Companies"
      page.should_not have_content "Aaron"
      page.should_not have_content "Sumner"
    end
  end

end
