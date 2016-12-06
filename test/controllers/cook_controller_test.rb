require 'test_helper'

class CookControllerTest < ActionDispatch::IntegrationTest
  test "should get orders" do
    get cook_orders_url
    assert_response :success
  end

  # test change status of items
  test "should  change order status" do
  		#meal = Meal.new(name: meals(:one).name , description: meals(:one).description,  price: meals(:one).price );
		#meal.save
		#table = Table.new(name: tables(:one).name , status: tables(:one).status);
		#table.save

		#order = Order.new(status: orders(:one).status , meal: orders(:one).meal)
		#order.save

  		id = Order.last.id
  		assert_equal 0, Order.find(id).status

  		post cook_postOrder_url, params: {order: { id => "1" }};
  		
  		assert_equal 1, Order.find(id).status
  	
  end

  test "should redirect to orders page " do
      id = Order.last.id

      post cook_postOrder_url, params: {order: { id => "1" }};
      
      assert_redirected_to cook_orders_url
    
  end

  
end
