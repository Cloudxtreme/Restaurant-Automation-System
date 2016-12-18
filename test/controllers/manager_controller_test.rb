require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get manager_main_url
    assert_response :success
  end

  test "should get draw_rates" do
    get manager_draw_rates_url
    assert_response :success
  end

  test "should get top_dishes" do
    get manager_top_dishes_url
    assert_response :success
  end

end
