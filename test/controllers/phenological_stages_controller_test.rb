require 'test_helper'

class PhenologicalStagesControllerTest < ActionController::TestCase
  setup do
    @phenological_stage = phenological_stages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phenological_stages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phenological_stage" do
    assert_difference('PhenologicalStage.count') do
      post :create, phenological_stage: { description: @phenological_stage.description, leachate_ids: @phenological_stage.leachate_ids, name: @phenological_stage.name }
    end

    assert_redirected_to phenological_stage_path(assigns(:phenological_stage))
  end

  test "should show phenological_stage" do
    get :show, id: @phenological_stage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phenological_stage
    assert_response :success
  end

  test "should update phenological_stage" do
    patch :update, id: @phenological_stage, phenological_stage: { description: @phenological_stage.description, leachate_ids: @phenological_stage.leachate_ids, name: @phenological_stage.name }
    assert_redirected_to phenological_stage_path(assigns(:phenological_stage))
  end

  test "should destroy phenological_stage" do
    assert_difference('PhenologicalStage.count', -1) do
      delete :destroy, id: @phenological_stage
    end

    assert_redirected_to phenological_stages_path
  end
end
