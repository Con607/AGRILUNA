require 'test_helper'

class SelectionItemsControllerTest < ActionController::TestCase
  setup do
    @selection_item = selection_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_item" do
    assert_difference('SelectionItem.count') do
      post :create, selection_item: { product_quality_id: @selection_item.product_quality_id, quantity: @selection_item.quantity, selection_id: @selection_item.selection_id }
    end

    assert_redirected_to selection_item_path(assigns(:selection_item))
  end

  test "should show selection_item" do
    get :show, id: @selection_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_item
    assert_response :success
  end

  test "should update selection_item" do
    patch :update, id: @selection_item, selection_item: { product_quality_id: @selection_item.product_quality_id, quantity: @selection_item.quantity, selection_id: @selection_item.selection_id }
    assert_redirected_to selection_item_path(assigns(:selection_item))
  end

  test "should destroy selection_item" do
    assert_difference('SelectionItem.count', -1) do
      delete :destroy, id: @selection_item
    end

    assert_redirected_to selection_items_path
  end
end
