require 'test_helper'

class WaiterControllerTest < ActionDispatch::IntegrationTest
  test "should get takeOrder" do
    get waiter_takeOrder_url
    assert_response :success
  end

  test "should get tables" do
    get waiter_tables_url
    assert_response :success
  end

  test"should add meals to Order" do
  	table_id = Table.last.id
  	meal_id = Meal.last.id
  	before_order = Order.all.length
    post waiter_postOrders_url, params: {orders: { meal_id => "1" },repitations: {meal_id => 5}, table_id: table_id };
    after_order = Order.all.length
    assert_not_equal before_order, after_order
  end

  test"should not add meals to Order if text box is empty" do
    table_id = Table.last.id
    meal_id = Meal.last.id
    before_order = Order.all.length
    post waiter_postOrders_url, params: {orders: { meal_id => "1" },repitations: {meal_id => ""}, table_id: table_id };
    after_order = Order.all.length
    assert_equal before_order, after_order
  end


  test"should waiter redirect to tables screen after take order" do
  	table_id = Table.last.id
  	meal_id = Meal.last.id
   post waiter_postOrders_url, params: {orders: { meal_id => "1" },repitations: {meal_id => 5}, table_id: table_id };
   assert_redirected_to waiter_tables_url
 end

  # test order new meal and see the number meal ordered
  test"should meal.number_times_ordered increase after order" do
  	table_id = Table.last.id
  	meal_id = Meal.last.id
  	before_order = Meal.find(meal_id).number_times_ordered
   post waiter_postOrders_url, params: {orders: { meal_id => "1" },repitations: {meal_id => 5}, table_id: table_id };
   after_order = Meal.find(meal_id).number_times_ordered
   assert_not_equal before_order, after_order
 end
  
  test"should updateOrder status to delivered when waiter delivers orders" do
   
    table_id = Table.last.id
    meal_id = Meal.last.id
    order1 = Order.create(:status => 1 , :table_id => table_id , :meal_id => meal_id)
     id1 = order1.id
    order2 = Order.create(:status => 1 , :table_id => table_id , :meal_id => meal_id)
    id2 = order2.id
    post waiter_updateOrderStatus_url, params: {order: { id1 => "1" ,id2 =>"1"}};
    assert_equal 2, Order.find(id2).status
    assert_equal 2, Order.find(id1).status
 end
  
end
