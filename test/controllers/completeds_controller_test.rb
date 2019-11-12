require 'test_helper'

class CompletedsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get completeds_create_url
    assert_response :success
  end

end
