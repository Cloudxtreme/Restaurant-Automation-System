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

   test "Icrement Count for 1 star" do
     before = Rating.where(num_stars: 1).last.num_times_rated
    post hosts_rate_url, params:{rateVal:"1"}
    after = Rating.where(num_stars:1).last.num_times_rated
     assert_equal before+1,after
    
   end


    test "Icrement Count for 2 star" do
     before = Rating.where(num_stars: 2).last.num_times_rated
    post hosts_rate_url, params:{rateVal:"2"}
    after = Rating.where(num_stars:2).last.num_times_rated
     assert_equal before+1,after
    
   end

    test "Icrement Count for 3 star" do
     before = Rating.where(num_stars: 3).last.num_times_rated
    post hosts_rate_url, params:{rateVal:"3"}
    after = Rating.where(num_stars:3).last.num_times_rated
     assert_equal before+1,after
    
   end

    test "Icrement Count for 4 star" do
     before = Rating.where(num_stars: 4).last.num_times_rated
    post hosts_rate_url, params:{rateVal:"4"}
    after = Rating.where(num_stars:4).last.num_times_rated
     assert_equal before+1,after
    
   end

    test "Icrement Count for 5 star" do
     before = Rating.where(num_stars: 5).last.num_times_rated
    post hosts_rate_url, params:{rateVal:"5"}
    after = Rating.where(num_stars:5).last.num_times_rated
     assert_equal before+1,after
    
   end


    test "Rating is not defined no rating changes for all from 1 to 5" do
     before5 = Rating.where(num_stars: 5).last.num_times_rated
     before4 = Rating.where(num_stars: 4).last.num_times_rated
     before3 = Rating.where(num_stars: 3).last.num_times_rated
     before2 = Rating.where(num_stars: 2).last.num_times_rated
     before1 = Rating.where(num_stars: 1).last.num_times_rated
    post hosts_rate_url, params:{rateVal:""}
    after5 = Rating.where(num_stars:5).last.num_times_rated
    after4 = Rating.where(num_stars:4).last.num_times_rated
    after3 = Rating.where(num_stars:3).last.num_times_rated
    after2 = Rating.where(num_stars:2).last.num_times_rated
    after1 = Rating.where(num_stars:1).last.num_times_rated
    i = 0;
    if(before1 == after1 && before2 == after2 && before3 == after3 && before4 == after4 && before5 == after5)
      i = 1;
    end


     assert_equal i,1 
    
   end

      test "Entry value for star 5 is negative" do
     before = Rating.where(num_stars: 5).last
     before.update(num_times_rated: -1)
    post hosts_rate_url, params:{rateVal:"5"}
    after = Rating.where(num_stars:5).last.num_times_rated
     assert_equal 1,after
    
   end



      test "Entry value for star 4 is negative" do
     before = Rating.where(num_stars: 4).last
     before.update(num_times_rated: -1)
    post hosts_rate_url, params:{rateVal:"4"}
    after = Rating.where(num_stars:4).last.num_times_rated
     assert_equal 1,after
    
   end


      test "Entry value for star 3 is negative" do
     before = Rating.where(num_stars: 3).last
     before.update(num_times_rated: -1)
    post hosts_rate_url, params:{rateVal:"3"}
    after = Rating.where(num_stars:3).last.num_times_rated
     assert_equal 1,after
    
   end


      test "Entry value for star 2 is negative" do
     before = Rating.where(num_stars: 2).last
     before.update(num_times_rated: -1)
    post hosts_rate_url, params:{rateVal:"2"}
    after = Rating.where(num_stars:2).last.num_times_rated
     assert_equal 1,after
    
   end


      test "Entry value for star 1 is negative" do
     before = Rating.where(num_stars: 1).last
     before.update(num_times_rated: -1)
    post hosts_rate_url, params:{rateVal:"1"}
    after = Rating.where(num_stars:1).last.num_times_rated
     assert_equal 1,after
    
   end


  

end