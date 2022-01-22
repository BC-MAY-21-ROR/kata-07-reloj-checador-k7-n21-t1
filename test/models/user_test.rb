require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = users(:admin)
    assert user.valid?
    assert_equal 'admin@gmail.com', user.email
  end
end
