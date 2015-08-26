require 'test_helper'

class OperatingCostsControllerTest < ActionController::TestCase
  setup do
    @operating_cost = operating_costs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operating_costs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operating_cost" do
    assert_difference('OperatingCost.count') do
      post :create, operating_cost: { concept: @operating_cost.concept, display: @operating_cost.display, event_date: @operating_cost.event_date, greenhouse_id: @operating_cost.greenhouse_id, quantity: @operating_cost.quantity, total: @operating_cost.total, unit_price: @operating_cost.unit_price }
    end

    assert_redirected_to operating_cost_path(assigns(:operating_cost))
  end

  test "should show operating_cost" do
    get :show, id: @operating_cost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operating_cost
    assert_response :success
  end

  test "should update operating_cost" do
    patch :update, id: @operating_cost, operating_cost: { concept: @operating_cost.concept, display: @operating_cost.display, event_date: @operating_cost.event_date, greenhouse_id: @operating_cost.greenhouse_id, quantity: @operating_cost.quantity, total: @operating_cost.total, unit_price: @operating_cost.unit_price }
    assert_redirected_to operating_cost_path(assigns(:operating_cost))
  end

  test "should destroy operating_cost" do
    assert_difference('OperatingCost.count', -1) do
      delete :destroy, id: @operating_cost
    end

    assert_redirected_to operating_costs_path
  end
end
