require 'test_helper'

class ProductQualitiesControllerTest < ActionController::TestCase
  setup do
    @product_quality = product_qualities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_quality" do
    assert_difference('ProductQuality.count') do
      post :create, product_quality: { description: @product_quality.description, name: @product_quality.name, product_id: @product_quality.product_id, sale_item_ids: @product_quality.sale_item_ids, selection_item_ids: @product_quality.selection_item_ids }
    end

    assert_redirected_to product_quality_path(assigns(:product_quality))
  end

  test "should show product_quality" do
    get :show, id: @product_quality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_quality
    assert_response :success
  end

  test "should update product_quality" do
    patch :update, id: @product_quality, product_quality: { description: @product_quality.description, name: @product_quality.name, product_id: @product_quality.product_id, sale_item_ids: @product_quality.sale_item_ids, selection_item_ids: @product_quality.selection_item_ids }
    assert_redirected_to product_quality_path(assigns(:product_quality))
  end

  test "should destroy product_quality" do
    assert_difference('ProductQuality.count', -1) do
      delete :destroy, id: @product_quality
    end

    assert_redirected_to product_qualities_path
  end
end
