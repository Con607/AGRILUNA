require 'test_helper'

class AdministrationCostsControllerTest < ActionController::TestCase
  setup do
    @administration_cost = administration_costs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_costs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_cost" do
    assert_difference('AdministrationCost.count') do
      post :create, administration_cost: { concept: @administration_cost.concept, display: @administration_cost.display, event_date: @administration_cost.event_date, greenhouse_id: @administration_cost.greenhouse_id, quantity: @administration_cost.quantity, total: @administration_cost.total, unit_price: @administration_cost.unit_price }
    end

    assert_redirected_to administration_cost_path(assigns(:administration_cost))
  end

  test "should show administration_cost" do
    get :show, id: @administration_cost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_cost
    assert_response :success
  end

  test "should update administration_cost" do
    patch :update, id: @administration_cost, administration_cost: { concept: @administration_cost.concept, display: @administration_cost.display, event_date: @administration_cost.event_date, greenhouse_id: @administration_cost.greenhouse_id, quantity: @administration_cost.quantity, total: @administration_cost.total, unit_price: @administration_cost.unit_price }
    assert_redirected_to administration_cost_path(assigns(:administration_cost))
  end

  test "should destroy administration_cost" do
    assert_difference('AdministrationCost.count', -1) do
      delete :destroy, id: @administration_cost
    end

    assert_redirected_to administration_costs_path
  end
end
