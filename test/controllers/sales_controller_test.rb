require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post :create, sale: { event_date: @sale.event_date, poduct_id: @sale.poduct_id, product_presentation_id: @sale.product_presentation_id, product_variety_id: @sale.product_variety_id, sale_item_ids: @sale.sale_item_ids, status: @sale.status, total_price: @sale.total_price }
    end

    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should show sale" do
    get :show, id: @sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale
    assert_response :success
  end

  test "should update sale" do
    patch :update, id: @sale, sale: { event_date: @sale.event_date, poduct_id: @sale.poduct_id, product_presentation_id: @sale.product_presentation_id, product_variety_id: @sale.product_variety_id, sale_item_ids: @sale.sale_item_ids, status: @sale.status, total_price: @sale.total_price }
    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: @sale
    end

    assert_redirected_to sales_path
  end
end
