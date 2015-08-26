require 'test_helper'

class ProductVarietiesControllerTest < ActionController::TestCase
  setup do
    @product_variety = product_varieties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_varieties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_variety" do
    assert_difference('ProductVariety.count') do
      post :create, product_variety: { description: @product_variety.description, harvest_ids: @product_variety.harvest_ids, name: @product_variety.name, product_id: @product_variety.product_id, sale_ids: @product_variety.sale_ids, selection_ids: @product_variety.selection_ids }
    end

    assert_redirected_to product_variety_path(assigns(:product_variety))
  end

  test "should show product_variety" do
    get :show, id: @product_variety
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_variety
    assert_response :success
  end

  test "should update product_variety" do
    patch :update, id: @product_variety, product_variety: { description: @product_variety.description, harvest_ids: @product_variety.harvest_ids, name: @product_variety.name, product_id: @product_variety.product_id, sale_ids: @product_variety.sale_ids, selection_ids: @product_variety.selection_ids }
    assert_redirected_to product_variety_path(assigns(:product_variety))
  end

  test "should destroy product_variety" do
    assert_difference('ProductVariety.count', -1) do
      delete :destroy, id: @product_variety
    end

    assert_redirected_to product_varieties_path
  end
end
