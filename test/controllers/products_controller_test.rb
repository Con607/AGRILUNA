require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, harvest_ids: @product.harvest_ids, name: @product.name, product_presentation_ids: @product.product_presentation_ids, product_quality_ids: @product.product_quality_ids, product_variety_ids: @product.product_variety_ids, sale_ids: @product.sale_ids, selection_ids: @product.selection_ids }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { description: @product.description, harvest_ids: @product.harvest_ids, name: @product.name, product_presentation_ids: @product.product_presentation_ids, product_quality_ids: @product.product_quality_ids, product_variety_ids: @product.product_variety_ids, sale_ids: @product.sale_ids, selection_ids: @product.selection_ids }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
