require "application_system_test_case"

class EmployeesSystemTest < ApplicationSystemTestCase
  test "redirects to home if not logged in" do
    visit pages_employees_path
    assert_text "You need to sign in or sign up before continuing."
  end

  test "employess pages loads for admin users" do
    sign_in users(:admin)
    visit pages_employees_path
    assert_text "Employees"
  end
end
