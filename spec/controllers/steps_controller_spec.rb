require 'rails_helper'

RSpec.describe StepsController, type: :controller do

  describe "GET #first" do
    it "returns http success" do
      get :first
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #second" do
    it "returns http success" do
      get :second
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #third" do
    it "returns http success" do
      get :third
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #fourth" do
    it "returns http success" do
      get :fourth
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #finish" do
    it "returns http success" do
      get :finish
      expect(response).to have_http_status(:success)
    end
  end

end
