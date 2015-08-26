require 'test_helper'

class SelectionsControllerTest < ActionController::TestCase
  setup do
    @selection = selections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection" do
    assert_difference('Selection.count') do
      post :create, selection: { event_date: @selection.event_date, greenhouse_id: @selection.greenhouse_id, product_id: @selection.product_id, product_presentation_id: @selection.product_presentation_id, product_variety_id: @selection.product_variety_id, selection_item_ids: @selection.selection_item_ids, total_weight: @selection.total_weight }
    end

    assert_redirected_to selection_path(assigns(:selection))
  end

  test "should show selection" do
    get :show, id: @selection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection
    assert_response :success
  end

  test "should update selection" do
    patch :update, id: @selection, selection: { event_date: @selection.event_date, greenhouse_id: @selection.greenhouse_id, product_id: @selection.product_id, product_presentation_id: @selection.product_presentation_id, product_variety_id: @selection.product_variety_id, selection_item_ids: @selection.selection_item_ids, total_weight: @selection.total_weight }
    assert_redirected_to selection_path(assigns(:selection))
  end

  test "should destroy selection" do
    assert_difference('Selection.count', -1) do
      delete :destroy, id: @selection
    end

    assert_redirected_to selections_path
  end
end
