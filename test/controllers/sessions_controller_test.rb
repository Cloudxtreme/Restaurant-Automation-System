require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
   test "successfull manager login" do
     post '/login', params: { session: {email:'manager@gmail.com', password: 'manager' }};
     #puts Employee.last.id
     assert_redirected_to '/manager'
   end
   test "successfull cook login" do
     post '/login', params: { session: {email:'cook@gmail.com', password: 'cook' }};
     assert_redirected_to '/cook/orders'
   end
   test "successfull host login" do
     post '/login', params: { session: {email:'host@gmail.com', password: 'host' }};
     assert_redirected_to '/host'
   end
   test "successfull waiter login" do
     post '/login', params: { session: {email:'waiter@gmail.com', password: 'waiter' }};
     assert_redirected_to '/waiter/tables'
   end
   test "unsuccessfull manager login" do
     post '/login', params: { session: {email:'manager@gmail.com', password: 'aykalam' }};
     assert_redirected_to '/login'
   end
   test "unsuccessfull cook login" do
     post '/login', params: { session: {email:'cook@gmail.com', password: 'aykalam' }};
     assert_redirected_to '/login'
   end
   test "unsuccessfull host login" do
     post '/login', params: { session: {email:'host@gmail.com', password: 'aykalam' }};
     assert_redirected_to '/login'
   end
   test "unsuccessfull waiter login" do
     post '/login', params: { session: {email:'waiter@gmail.com', password: 'aykalam' }};
     assert_redirected_to '/login'
   end
end
