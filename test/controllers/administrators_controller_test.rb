require 'test_helper'

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get administrators_home_url
    assert_response :success
  end

end
