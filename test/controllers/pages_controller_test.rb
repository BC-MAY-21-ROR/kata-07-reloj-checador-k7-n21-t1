require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "redicts to home when not logged in" do
    get pages_employees_path
    assert_redirected_to new_user_session_url
  end

  test "should get employees pages" do
    sign_in users(:admin)
    get pages_employees_path
    assert_response :success
  end
end
