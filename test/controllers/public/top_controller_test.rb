require 'test_helper'

class Public::TopControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_top_top_url
    assert_response :success
  end

end
