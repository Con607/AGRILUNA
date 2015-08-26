require 'test_helper'

class EnvironmentalConditionsControllerTest < ActionController::TestCase
  setup do
    @environmental_condition = environmental_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:environmental_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create environmental_condition" do
    assert_difference('EnvironmentalCondition.count') do
      post :create, environmental_condition: { environment_id: @environmental_condition.environment_id, event_date: @environmental_condition.event_date, greenhouse_id: @environmental_condition.greenhouse_id, max_rel_humidity: @environmental_condition.max_rel_humidity, max_temp: @environmental_condition.max_temp, min_rel_humidity: @environmental_condition.min_rel_humidity, min_temp: @environmental_condition.min_temp, weather_id: @environmental_condition.weather_id }
    end

    assert_redirected_to environmental_condition_path(assigns(:environmental_condition))
  end

  test "should show environmental_condition" do
    get :show, id: @environmental_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @environmental_condition
    assert_response :success
  end

  test "should update environmental_condition" do
    patch :update, id: @environmental_condition, environmental_condition: { environment_id: @environmental_condition.environment_id, event_date: @environmental_condition.event_date, greenhouse_id: @environmental_condition.greenhouse_id, max_rel_humidity: @environmental_condition.max_rel_humidity, max_temp: @environmental_condition.max_temp, min_rel_humidity: @environmental_condition.min_rel_humidity, min_temp: @environmental_condition.min_temp, weather_id: @environmental_condition.weather_id }
    assert_redirected_to environmental_condition_path(assigns(:environmental_condition))
  end

  test "should destroy environmental_condition" do
    assert_difference('EnvironmentalCondition.count', -1) do
      delete :destroy, id: @environmental_condition
    end

    assert_redirected_to environmental_conditions_path
  end
end
