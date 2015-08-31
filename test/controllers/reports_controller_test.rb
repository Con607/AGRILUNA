require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get quick_general_status" do
    get :quick_general_status
    assert_response :success
  end

end
