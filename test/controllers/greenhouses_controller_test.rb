require 'test_helper'

class GreenhousesControllerTest < ActionController::TestCase
  setup do
    @greenhouse = greenhouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:greenhouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create greenhouse" do
    assert_difference('Greenhouse.count') do
      post :create, greenhouse: { description: @greenhouse.description, employee_ids: @greenhouse.employee_ids, location: @greenhouse.location, name: @greenhouse.name }
    end

    assert_redirected_to greenhouse_path(assigns(:greenhouse))
  end

  test "should show greenhouse" do
    get :show, id: @greenhouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @greenhouse
    assert_response :success
  end

  test "should update greenhouse" do
    patch :update, id: @greenhouse, greenhouse: { description: @greenhouse.description, employee_ids: @greenhouse.employee_ids, location: @greenhouse.location, name: @greenhouse.name }
    assert_redirected_to greenhouse_path(assigns(:greenhouse))
  end

  test "should destroy greenhouse" do
    assert_difference('Greenhouse.count', -1) do
      delete :destroy, id: @greenhouse
    end

    assert_redirected_to greenhouses_path
  end
end
