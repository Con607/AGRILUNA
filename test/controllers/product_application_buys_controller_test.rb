require 'test_helper'

class ProductApplicationBuysControllerTest < ActionController::TestCase
  setup do
    @product_application_buy = product_application_buys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_application_buys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_application_buy" do
    assert_difference('ProductApplicationBuy.count') do
      post :create, product_application_buy: { application_product_id: @product_application_buy.application_product_id, buy_date: @product_application_buy.buy_date, greenhouse_id: @product_application_buy.greenhouse_id, quanity: @product_application_buy.quanity, supplier_id: @product_application_buy.supplier_id, total_cost: @product_application_buy.total_cost, unit: @product_application_buy.unit, unit_cost: @product_application_buy.unit_cost }
    end

    assert_redirected_to product_application_buy_path(assigns(:product_application_buy))
  end

  test "should show product_application_buy" do
    get :show, id: @product_application_buy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_application_buy
    assert_response :success
  end

  test "should update product_application_buy" do
    patch :update, id: @product_application_buy, product_application_buy: { application_product_id: @product_application_buy.application_product_id, buy_date: @product_application_buy.buy_date, greenhouse_id: @product_application_buy.greenhouse_id, quanity: @product_application_buy.quanity, supplier_id: @product_application_buy.supplier_id, total_cost: @product_application_buy.total_cost, unit: @product_application_buy.unit, unit_cost: @product_application_buy.unit_cost }
    assert_redirected_to product_application_buy_path(assigns(:product_application_buy))
  end

  test "should destroy product_application_buy" do
    assert_difference('ProductApplicationBuy.count', -1) do
      delete :destroy, id: @product_application_buy
    end

    assert_redirected_to product_application_buys_path
  end
end
