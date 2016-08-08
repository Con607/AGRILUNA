require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

describe "Accounts", js: true do
  DatabaseCleaner.clean

  @accounts_module = FactoryGirl.create(:permission, value: "accounts")
  @accounts_index = FactoryGirl.create(:permission, value: "user_accounts/index")
  @accounts_create = FactoryGirl.create(:permission, value: "user_accounts/create")
  @accounts_new = FactoryGirl.create(:permission, value: "user_accounts/new")
  @accounts_show = FactoryGirl.create(:permission, value: "user_accounts/show")

  @role_accounts = FactoryGirl.create(:role, permissions: [@accounts_module, @accounts_index,
                                                              @accounts_create, @accounts_new, @accounts_show])
	user = FactoryGirl.create(:user, roles: [@role_accounts])
	login_as(user, :scope => :user)

  describe "Manage accounts" do
    it "Adds a new account and displays the results" do
      #visit accounts_url
      #expect{
      #  click_link 'New Account'
      #  fill_in 'Name', with: "Jhon"
      #  fill_in 'Description', with: "Smith"
      #  fill_in 'Address', with: "Valladolid 434 Centro"
      #  fill_in 'Telephone', with: "5553324"
      #  click_button "Create Account"
      #}.to change(Account,:count).by(1)
      #page.should have_content "Account was successfully created."
      ##within 'h1' do
      # # page.should have_content "John"
      ##end
      #page.should have_content "Jhon"
      #page.should have_content "Smith"
      #page.should have_content "5553324"
      #page.should have_content "Valladolid 434 Centro"
    end
  end
end
