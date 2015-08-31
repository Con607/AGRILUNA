require 'test_helper'

class UnitConversionsControllerTest < ActionController::TestCase
  setup do
    @unit_conversion = unit_conversions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_conversions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_conversion" do
    assert_difference('UnitConversion.count') do
      post :create, unit_conversion: { convert_to: @unit_conversion.convert_to, unit_type_id: @unit_conversion.unit_type_id, value: @unit_conversion.value }
    end

    assert_redirected_to unit_conversion_path(assigns(:unit_conversion))
  end

  test "should show unit_conversion" do
    get :show, id: @unit_conversion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit_conversion
    assert_response :success
  end

  test "should update unit_conversion" do
    patch :update, id: @unit_conversion, unit_conversion: { convert_to: @unit_conversion.convert_to, unit_type_id: @unit_conversion.unit_type_id, value: @unit_conversion.value }
    assert_redirected_to unit_conversion_path(assigns(:unit_conversion))
  end

  test "should destroy unit_conversion" do
    assert_difference('UnitConversion.count', -1) do
      delete :destroy, id: @unit_conversion
    end

    assert_redirected_to unit_conversions_path
  end
end
