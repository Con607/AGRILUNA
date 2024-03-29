require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { first_name: @employee.first_name, greenhouse_id: @employee.greenhouse_id, job_position_id: @employee.job_position_id, last_name: @employee.last_name, salary: @employee.salary, second_last_name: @employee.second_last_name, second_name: @employee.second_name }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { first_name: @employee.first_name, greenhouse_id: @employee.greenhouse_id, job_position_id: @employee.job_position_id, last_name: @employee.last_name, salary: @employee.salary, second_last_name: @employee.second_last_name, second_name: @employee.second_name }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
