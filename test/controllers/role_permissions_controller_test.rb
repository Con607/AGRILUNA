require 'test_helper'

class RolePermissionsControllerTest < ActionController::TestCase
  setup do
    @role_permission = role_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_permission" do
    assert_difference('RolePermission.count') do
      post :create, role_permission: { permision_id: @role_permission.permision_id, role_id: @role_permission.role_id }
    end

    assert_redirected_to role_permission_path(assigns(:role_permission))
  end

  test "should show role_permission" do
    get :show, id: @role_permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_permission
    assert_response :success
  end

  test "should update role_permission" do
    patch :update, id: @role_permission, role_permission: { permision_id: @role_permission.permision_id, role_id: @role_permission.role_id }
    assert_redirected_to role_permission_path(assigns(:role_permission))
  end

  test "should destroy role_permission" do
    assert_difference('RolePermission.count', -1) do
      delete :destroy, id: @role_permission
    end

    assert_redirected_to role_permissions_path
  end
end
