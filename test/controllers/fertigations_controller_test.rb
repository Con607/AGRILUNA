require 'test_helper'

class FertigationsControllerTest < ActionController::TestCase
  setup do
    @fertigation = fertigations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fertigations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fertigation" do
    assert_difference('Fertigation.count') do
      post :create, fertigation: { fertigation_datetime: @fertigation.fertigation_datetime, fertigation_item_ids: @fertigation.fertigation_item_ids, greenhouse_id: @fertigation.greenhouse_id, tank: @fertigation.tank, total_cost: @fertigation.total_cost }
    end

    assert_redirected_to fertigation_path(assigns(:fertigation))
  end

  test "should show fertigation" do
    get :show, id: @fertigation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fertigation
    assert_response :success
  end

  test "should update fertigation" do
    patch :update, id: @fertigation, fertigation: { fertigation_datetime: @fertigation.fertigation_datetime, fertigation_item_ids: @fertigation.fertigation_item_ids, greenhouse_id: @fertigation.greenhouse_id, tank: @fertigation.tank, total_cost: @fertigation.total_cost }
    assert_redirected_to fertigation_path(assigns(:fertigation))
  end

  test "should destroy fertigation" do
    assert_difference('Fertigation.count', -1) do
      delete :destroy, id: @fertigation
    end

    assert_redirected_to fertigations_path
  end
end
