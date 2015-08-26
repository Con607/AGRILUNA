require 'test_helper'

class HarvestsControllerTest < ActionController::TestCase
  setup do
    @harvest = harvests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:harvests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create harvest" do
    assert_difference('Harvest.count') do
      post :create, harvest: { event_date: @harvest.event_date, greenhouse_id: @harvest.greenhouse_id, product_id: @harvest.product_id, product_presentation_id: @harvest.product_presentation_id, product_quantity: @harvest.product_quantity, product_variety_id: @harvest.product_variety_id, total_harvested: @harvest.total_harvested }
    end

    assert_redirected_to harvest_path(assigns(:harvest))
  end

  test "should show harvest" do
    get :show, id: @harvest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @harvest
    assert_response :success
  end

  test "should update harvest" do
    patch :update, id: @harvest, harvest: { event_date: @harvest.event_date, greenhouse_id: @harvest.greenhouse_id, product_id: @harvest.product_id, product_presentation_id: @harvest.product_presentation_id, product_quantity: @harvest.product_quantity, product_variety_id: @harvest.product_variety_id, total_harvested: @harvest.total_harvested }
    assert_redirected_to harvest_path(assigns(:harvest))
  end

  test "should destroy harvest" do
    assert_difference('Harvest.count', -1) do
      delete :destroy, id: @harvest
    end

    assert_redirected_to harvests_path
  end
end
