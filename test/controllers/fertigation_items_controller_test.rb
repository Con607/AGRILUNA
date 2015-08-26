require 'test_helper'

class FertigationItemsControllerTest < ActionController::TestCase
  setup do
    @fertigation_item = fertigation_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fertigation_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fertigation_item" do
    assert_difference('FertigationItem.count') do
      post :create, fertigation_item: { application_product_id: @fertigation_item.application_product_id, concentration: @fertigation_item.concentration, cost: @fertigation_item.cost, fertigation_id: @fertigation_item.fertigation_id, fertilizer_cost_per_unit: @fertigation_item.fertilizer_cost_per_unit, fertilizer_quantity: @fertigation_item.fertilizer_quantity, h20_quantity: @fertigation_item.h20_quantity, injection_rate: @fertigation_item.injection_rate, unit_measure: @fertigation_item.unit_measure }
    end

    assert_redirected_to fertigation_item_path(assigns(:fertigation_item))
  end

  test "should show fertigation_item" do
    get :show, id: @fertigation_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fertigation_item
    assert_response :success
  end

  test "should update fertigation_item" do
    patch :update, id: @fertigation_item, fertigation_item: { application_product_id: @fertigation_item.application_product_id, concentration: @fertigation_item.concentration, cost: @fertigation_item.cost, fertigation_id: @fertigation_item.fertigation_id, fertilizer_cost_per_unit: @fertigation_item.fertilizer_cost_per_unit, fertilizer_quantity: @fertigation_item.fertilizer_quantity, h20_quantity: @fertigation_item.h20_quantity, injection_rate: @fertigation_item.injection_rate, unit_measure: @fertigation_item.unit_measure }
    assert_redirected_to fertigation_item_path(assigns(:fertigation_item))
  end

  test "should destroy fertigation_item" do
    assert_difference('FertigationItem.count', -1) do
      delete :destroy, id: @fertigation_item
    end

    assert_redirected_to fertigation_items_path
  end
end
