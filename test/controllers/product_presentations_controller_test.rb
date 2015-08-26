require 'test_helper'

class ProductPresentationsControllerTest < ActionController::TestCase
  setup do
    @product_presentation = product_presentations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_presentations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_presentation" do
    assert_difference('ProductPresentation.count') do
      post :create, product_presentation: { description: @product_presentation.description, harvest_ids: @product_presentation.harvest_ids, name: @product_presentation.name, product_id: @product_presentation.product_id, sale_ids: @product_presentation.sale_ids, selection_ids: @product_presentation.selection_ids }
    end

    assert_redirected_to product_presentation_path(assigns(:product_presentation))
  end

  test "should show product_presentation" do
    get :show, id: @product_presentation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_presentation
    assert_response :success
  end

  test "should update product_presentation" do
    patch :update, id: @product_presentation, product_presentation: { description: @product_presentation.description, harvest_ids: @product_presentation.harvest_ids, name: @product_presentation.name, product_id: @product_presentation.product_id, sale_ids: @product_presentation.sale_ids, selection_ids: @product_presentation.selection_ids }
    assert_redirected_to product_presentation_path(assigns(:product_presentation))
  end

  test "should destroy product_presentation" do
    assert_difference('ProductPresentation.count', -1) do
      delete :destroy, id: @product_presentation
    end

    assert_redirected_to product_presentations_path
  end
end
