require 'test_helper'

class StudentssControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get studentss_home_url
    assert_response :success
  end

end
