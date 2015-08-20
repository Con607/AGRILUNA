require 'test_helper'

class GreenhouseEmployeesControllerTest < ActionController::TestCase
  setup do
    @greenhouse_employee = greenhouse_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:greenhouse_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create greenhouse_employee" do
    assert_difference('GreenhouseEmployee.count') do
      post :create, greenhouse_employee: { employee_id: @greenhouse_employee.employee_id, greenhouse_id: @greenhouse_employee.greenhouse_id }
    end

    assert_redirected_to greenhouse_employee_path(assigns(:greenhouse_employee))
  end

  test "should show greenhouse_employee" do
    get :show, id: @greenhouse_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @greenhouse_employee
    assert_response :success
  end

  test "should update greenhouse_employee" do
    patch :update, id: @greenhouse_employee, greenhouse_employee: { employee_id: @greenhouse_employee.employee_id, greenhouse_id: @greenhouse_employee.greenhouse_id }
    assert_redirected_to greenhouse_employee_path(assigns(:greenhouse_employee))
  end

  test "should destroy greenhouse_employee" do
    assert_difference('GreenhouseEmployee.count', -1) do
      delete :destroy, id: @greenhouse_employee
    end

    assert_redirected_to greenhouse_employees_path
  end
end
