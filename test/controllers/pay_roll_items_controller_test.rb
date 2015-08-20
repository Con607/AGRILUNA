require 'test_helper'

class PayRollItemsControllerTest < ActionController::TestCase
  setup do
    @pay_roll_item = pay_roll_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_roll_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_roll_item" do
    assert_difference('PayRollItem.count') do
      post :create, pay_roll_item: { assistances: @pay_roll_item.assistances, bonuses: @pay_roll_item.bonuses, discounts: @pay_roll_item.discounts, employee_id: @pay_roll_item.employee_id, pay_roll_id: @pay_roll_item.pay_roll_id, salary: @pay_roll_item.salary, total: @pay_roll_item.total }
    end

    assert_redirected_to pay_roll_item_path(assigns(:pay_roll_item))
  end

  test "should show pay_roll_item" do
    get :show, id: @pay_roll_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_roll_item
    assert_response :success
  end

  test "should update pay_roll_item" do
    patch :update, id: @pay_roll_item, pay_roll_item: { assistances: @pay_roll_item.assistances, bonuses: @pay_roll_item.bonuses, discounts: @pay_roll_item.discounts, employee_id: @pay_roll_item.employee_id, pay_roll_id: @pay_roll_item.pay_roll_id, salary: @pay_roll_item.salary, total: @pay_roll_item.total }
    assert_redirected_to pay_roll_item_path(assigns(:pay_roll_item))
  end

  test "should destroy pay_roll_item" do
    assert_difference('PayRollItem.count', -1) do
      delete :destroy, id: @pay_roll_item
    end

    assert_redirected_to pay_roll_items_path
  end
end
