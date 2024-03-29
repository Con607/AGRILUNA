require 'test_helper'

class UserCompaniesControllerTest < ActionController::TestCase
  setup do
    @user_company = user_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_company" do
    assert_difference('UserCompany.count') do
      post :create, user_company: { company_id: @user_company.company_id, user_id: @user_company.user_id }
    end

    assert_redirected_to user_company_path(assigns(:user_company))
  end

  test "should show user_company" do
    get :show, id: @user_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_company
    assert_response :success
  end

  test "should update user_company" do
    patch :update, id: @user_company, user_company: { company_id: @user_company.company_id, user_id: @user_company.user_id }
    assert_redirected_to user_company_path(assigns(:user_company))
  end

  test "should destroy user_company" do
    assert_difference('UserCompany.count', -1) do
      delete :destroy, id: @user_company
    end

    assert_redirected_to user_companies_path
  end
end
