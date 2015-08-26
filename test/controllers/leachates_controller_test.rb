require 'test_helper'

class LeachatesControllerTest < ActionController::TestCase
  setup do
    @leachate = leachates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leachates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leachate" do
    assert_difference('Leachate.count') do
      post :create, leachate: { ce_leachate: @leachate.ce_leachate, ce_nutritive_solution: @leachate.ce_nutritive_solution, ddt: @leachate.ddt, dropper_spending: @leachate.dropper_spending, event_date: @leachate.event_date, greenhouse_id: @leachate.greenhouse_id, irrigations: @leachate.irrigations, ph_leachate: @leachate.ph_leachate, ph_nutritive_solution: @leachate.ph_nutritive_solution, phenological_stage_id: @leachate.phenological_stage_id }
    end

    assert_redirected_to leachate_path(assigns(:leachate))
  end

  test "should show leachate" do
    get :show, id: @leachate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leachate
    assert_response :success
  end

  test "should update leachate" do
    patch :update, id: @leachate, leachate: { ce_leachate: @leachate.ce_leachate, ce_nutritive_solution: @leachate.ce_nutritive_solution, ddt: @leachate.ddt, dropper_spending: @leachate.dropper_spending, event_date: @leachate.event_date, greenhouse_id: @leachate.greenhouse_id, irrigations: @leachate.irrigations, ph_leachate: @leachate.ph_leachate, ph_nutritive_solution: @leachate.ph_nutritive_solution, phenological_stage_id: @leachate.phenological_stage_id }
    assert_redirected_to leachate_path(assigns(:leachate))
  end

  test "should destroy leachate" do
    assert_difference('Leachate.count', -1) do
      delete :destroy, id: @leachate
    end

    assert_redirected_to leachates_path
  end
end
