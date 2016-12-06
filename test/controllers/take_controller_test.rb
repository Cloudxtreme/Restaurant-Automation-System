require 'test_helper'

class TakeControllerTest < ActionDispatch::IntegrationTest
  test "should get place" do
    get take_place_url
    assert_response :success
  end

end
