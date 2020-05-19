require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_url
    assert_response :success
  end

end
