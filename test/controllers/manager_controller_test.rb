require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  
    def setup
    post '/login', params: { session: {email:'manager@gmail.com', password: 'manager' }};
   end

  test "should get main page" do
    get manager_main_url
    assert_response :success
  end

  test "should get draw_rates page" do
    get manager_draw_rates_url
    assert_response :success
  end

  test "should get top_dishes page" do
    get manager_top_dishes_url
    assert_response :success
  end



end
