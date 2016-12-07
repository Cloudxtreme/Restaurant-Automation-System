require 'test_helper'

class HostsControllerTest < ActionDispatch::IntegrationTest
  #test of view table statuses
   test "Retreive of Free tables has the actual free tables" do
     avails = Table.where(status:0 )
     assert_equal avails.first.name,'table1'
   end
   test "Retreive of Free tables has no busy tables" do
     avails = Table.where(status:0 )
     assert_not_equal avails.first.name,'table2'
   end
   test "Retreive of Busy tables has the actual busy tables" do
     avails = Table.where(status:1 )
     assert_equal avails.first.name,'table2'
   end
   test "Retreive of Busy tables has no free tables" do
     avails = Table.where(status:1 )
     assert_not_equal avails.first.name,'table1'
   end

end
