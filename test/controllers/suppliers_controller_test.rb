require 'test_helper'

class SuppliersControllerTest < ActionController::TestCase
  setup do
    @supplier = suppliers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post :create, supplier: { address: @supplier.address, celphone: @supplier.celphone, contact_name: @supplier.contact_name, description: @supplier.description, email: @supplier.email, name: @supplier.name, product_application_buy_ids: @supplier.product_application_buy_ids, telephone: @supplier.telephone }
    end

    assert_redirected_to supplier_path(assigns(:supplier))
  end

  test "should show supplier" do
    get :show, id: @supplier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier
    assert_response :success
  end

  test "should update supplier" do
    patch :update, id: @supplier, supplier: { address: @supplier.address, celphone: @supplier.celphone, contact_name: @supplier.contact_name, description: @supplier.description, email: @supplier.email, name: @supplier.name, product_application_buy_ids: @supplier.product_application_buy_ids, telephone: @supplier.telephone }
    assert_redirected_to supplier_path(assigns(:supplier))
  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete :destroy, id: @supplier
    end

    assert_redirected_to suppliers_path
  end
end
