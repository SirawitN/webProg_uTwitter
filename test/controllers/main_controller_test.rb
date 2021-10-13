require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get logIn" do
    get main_logIn_url
    assert_response :success
  end

  test "should get feed" do
    get main_feed_url
    assert_response :success
  end
end
