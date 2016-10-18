require 'test_helper'

class CollegesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get colleges_new_url
    assert_response :success
  end

end
