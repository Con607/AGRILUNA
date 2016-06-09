require 'test_helper'

class ApportionmentPerGreenhousesControllerTest < ActionController::TestCase
  setup do
    @apportionment_per_greenhouse = apportionment_per_greenhouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apportionment_per_greenhouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apportionment_per_greenhouse" do
    assert_difference('ApportionmentPerGreenhouse.count') do
      post :create, apportionment_per_greenhouse: { administration_cost_id: @apportionment_per_greenhouse.administration_cost_id, amount: @apportionment_per_greenhouse.amount, event_date: @apportionment_per_greenhouse.event_date, greenhouse_id: @apportionment_per_greenhouse.greenhouse_id, percentage: @apportionment_per_greenhouse.percentage }
    end

    assert_redirected_to apportionment_per_greenhouse_path(assigns(:apportionment_per_greenhouse))
  end

  test "should show apportionment_per_greenhouse" do
    get :show, id: @apportionment_per_greenhouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apportionment_per_greenhouse
    assert_response :success
  end

  test "should update apportionment_per_greenhouse" do
    patch :update, id: @apportionment_per_greenhouse, apportionment_per_greenhouse: { administration_cost_id: @apportionment_per_greenhouse.administration_cost_id, amount: @apportionment_per_greenhouse.amount, event_date: @apportionment_per_greenhouse.event_date, greenhouse_id: @apportionment_per_greenhouse.greenhouse_id, percentage: @apportionment_per_greenhouse.percentage }
    assert_redirected_to apportionment_per_greenhouse_path(assigns(:apportionment_per_greenhouse))
  end

  test "should destroy apportionment_per_greenhouse" do
    assert_difference('ApportionmentPerGreenhouse.count', -1) do
      delete :destroy, id: @apportionment_per_greenhouse
    end

    assert_redirected_to apportionment_per_greenhouses_path
  end
end
