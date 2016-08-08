require 'rails_helper'


RSpec.describe CompaniesController, type: :controller do
	include Devise::Test::ControllerHelpers
	include ActiveModel::Validations

	login_user

	it "should have a current_user" do
	  # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
	  expect(subject.current_user).to_not eq(nil)
	end

	describe "GET #index" do

		before :each do
			@jones = FactoryGirl.create(:user, email: Faker::Internet.email, password: "fgt43r5gdfgE", password_confirmation: "fgt43r5gdfgE", confirmed_at: Date.today)
			@keneth = FactoryGirl.create(:user, email: Faker::Internet.email, password: "345dfgIy234565", password_confirmation: "345dfgIy234565", confirmed_at: Date.today)
    		@agriluna = FactoryGirl.create(:company, users: [@keneth, subject.current_user])
			@don_mario = FactoryGirl.create(:company, users: [@jones, @keneth])
			@monte_bello = FactoryGirl.create(:company, users: [@jones, subject.current_user])
    	end

		it "should get index" do
		  # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
		  # the valid_session overrides the devise login. Remove the valid_session from your specs
		  get 'index'
		  response.should be_success
		end

		context "returns a sorted array of companies" do
			it "shows current_user companies" do
			  subject.current_user.companies.should == [@agriluna, @monte_bello]
			end
		end

		context "returns a sorted array of companies" do
			it "excludes non current_user companies" do
			  subject.current_user.companies.should_not include @don_mario
			end
		end
	end

	describe "GET #show" do

		before :each do
			@jones = FactoryGirl.create(:user, email: Faker::Internet.email, password: "fgt43r5gdfgE", password_confirmation: "fgt43r5gdfgE")
			@keneth = FactoryGirl.create(:user, email: Faker::Internet.email, password: "345dfgIy234565", password_confirmation: "345dfgIy234565")
    		@agriluna = FactoryGirl.create(:company, users: [@keneth, subject.current_user])
			@don_mario = FactoryGirl.create(:company, users: [@jones, @keneth])
			@monte_bello = FactoryGirl.create(:company, users: [@jones, subject.current_user])
		end

		it "assigns the requested company to @company" do
			get :show, id: @agriluna
    		assigns(:company).should eq(@agriluna)
    	end

		it "renders the :show template" do
			get :show, id: @agriluna
    		response.should render_template :show
    	end
	end
	
	describe "GET #new" do
		it "renders the :new template" do
			get :new
    		response.should render_template :new
    	end

		it "assigns a new company to @company" do
			get :new
			assigns(:company).should be_a_new(Company)
		end
	end
	
	describe "POST #create" do
	  context "with valid attributes" do
	  	it "creates a new company" do
    		expect{
    		  post :create, company: FactoryGirl.attributes_for(:company)
    		}.to change(Company,:count).by(1)
    	end

	    it "redirects to the new company" do
    		post :create, company: FactoryGirl.attributes_for(:company)
    		response.should redirect_to Company.last
    	end
	  end
	  
	  context "with invalid attributes" do
	    it "does not save the new company" do
    		expect{
    		  post :create, company: FactoryGirl.attributes_for(:invalid_company)
    		}.to_not change(Company,:count)
    	end
    
    	it "re-renders the new method" do
    		post :create, company: FactoryGirl.attributes_for(:invalid_company)
    		response.should render_template :new
    	end
	  end
	end

	describe 'PUT update' do
		before :each do
		  @company = FactoryGirl.create(:company)
		end
		
		context "valid attributes" do
		  it "located the requested @company" do
		    put :update, id: @company, company: FactoryGirl.attributes_for(:company)
		    assigns(:company).should eq(@company)      
		  end
		
		  it "changes @company's attributes" do
		    put :update, id: @company, 
		      company: FactoryGirl.attributes_for(:company, name: "Larry", description: "Lorem Ipsum Dolor...")
		    @company.reload
		    @company.name.should eq("Larry")
		    @company.description.should eq("Lorem Ipsum Dolor...")
		  end
		
		  it "redirects to the updated company" do
		    put :update, id: @company, company: FactoryGirl.attributes_for(:company)
		    response.should redirect_to @company
		  end
		end
		
		context "invalid attributes" do
		  it "locates the requested @company" do
		    put :update, id: @company, company: FactoryGirl.attributes_for(:invalid_company)
		    assigns(:company).should eq(@company)      
		  end
		  
		  it "does not change @company's attributes" do
		    put :update, id: @company, company: FactoryGirl.attributes_for(:company, name: "Sandra", description: nil)
		    @company.reload
		    @company.name.should_not eq("Sandra")
		    @company.description.should_not eq("Lorem Ipsum Dolor...")
		  end
		  
		  it "re-renders the edit method" do
		    put :update, id: @company, company: FactoryGirl.attributes_for(:invalid_company)
		    response.should render_template :edit
		  end
		end
	end

	describe 'DELETE destroy' do
	  	before :each do
	  	  @company = FactoryGirl.create(:company)
	  	end
	  	
	  	it "deletes the company" do
	  	  expect{
	  	    delete :destroy, id: @company        
	  	  }.to change(Company,:count).by(-1)
	  	end
	  	  
	  	it "redirects to companys#index" do
	  	  delete :destroy, id: @company
	  	  response.should redirect_to companies_url
	  	end
	end

end


