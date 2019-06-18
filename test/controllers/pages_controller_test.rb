require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get :home" do
    get pages_:home_url
    assert_response :success
  end

  test "should get :about" do
    get pages_:about_url
    assert_response :success
  end

end
