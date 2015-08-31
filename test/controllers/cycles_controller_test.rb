require 'test_helper'

class CyclesControllerTest < ActionController::TestCase
  setup do
    @cycle = cycles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cycles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cycle" do
    assert_difference('Cycle.count') do
      post :create, cycle: { end_date: @cycle.end_date, estimated_performance_per_m2: @cycle.estimated_performance_per_m2, expected_average_selling_price_per_kg: @cycle.expected_average_selling_price_per_kg, expected_total_expenses: @cycle.expected_total_expenses, expected_total_profit: @cycle.expected_total_profit, greenhouse_estimated_performance: @cycle.greenhouse_estimated_performance, greenhouse_id: @cycle.greenhouse_id, maximum_estimated_production_cost: @cycle.maximum_estimated_production_cost, name: @cycle.name, start_date: @cycle.start_date }
    end

    assert_redirected_to cycle_path(assigns(:cycle))
  end

  test "should show cycle" do
    get :show, id: @cycle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cycle
    assert_response :success
  end

  test "should update cycle" do
    patch :update, id: @cycle, cycle: { end_date: @cycle.end_date, estimated_performance_per_m2: @cycle.estimated_performance_per_m2, expected_average_selling_price_per_kg: @cycle.expected_average_selling_price_per_kg, expected_total_expenses: @cycle.expected_total_expenses, expected_total_profit: @cycle.expected_total_profit, greenhouse_estimated_performance: @cycle.greenhouse_estimated_performance, greenhouse_id: @cycle.greenhouse_id, maximum_estimated_production_cost: @cycle.maximum_estimated_production_cost, name: @cycle.name, start_date: @cycle.start_date }
    assert_redirected_to cycle_path(assigns(:cycle))
  end

  test "should destroy cycle" do
    assert_difference('Cycle.count', -1) do
      delete :destroy, id: @cycle
    end

    assert_redirected_to cycles_path
  end
end
