require 'test_helper'

class PermitedTeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get permited_teachers_create_url
    assert_response :success
  end

end
