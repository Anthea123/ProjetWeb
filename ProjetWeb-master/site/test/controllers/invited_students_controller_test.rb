require 'test_helper'

class InvitedStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get invited_students_create_url
    assert_response :success
  end

end
