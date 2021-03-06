class HostsController < ApplicationController
  before_action :require_host, only: [:new , :TabelBill, :checkin ,:updateStatusTables,:checkout]
  protect_from_forgery
  def new
    @avail_tables =   Table.where(status:0 )
    @busy_tables =   Table.where(status:1 )
  end


    def checkin
     @tabels=Table.select('id,status,name').where(status: 0)
    end

    def updateStatusTables
      p keyss = params[:tabel_id]
      @TabelId=Table.find(keyss)
      @TabelId.update(status: 1); #update taple as busy
    redirect_to hosts_checkin_path
    end



    def checkout
       @checkOutTabels=Table.select('id,status,name').where(status: 1)
    end

      def TabelBill
    #<%= collection_select(:table_id, @stars, :id, :num_stars)%>

       keyss = params[:tabel_id]
       @myID = params[:tabel_id]
       @orders= Order.select('meal_id,status').where(table_id: keyss)
            @TabelId=Table.find(keyss)
            @TabelId.update(status: 0); #update taple as free

       p @orders

       @Details= []
       @sum=0.0;
       i=0
       while  @orders[i]!= nil
       p bill= Meal.select('name,price').where(id: @orders[i].meal_id)
       @sum=@sum+bill[0].price
            mm=Meal.new;

       mm.name=bill[0].name
       mm.price=bill[0].price
       @Details << mm

       i = i+1

       end
        #..........
        Order.where(:table_id => keyss).destroy_all
    end

    def rate

      rateVal = params[:rateVal]
      #id = params[:table_id]
      i = 0
      @current = Rating.where(num_stars: 1).take
      if(rateVal == "1")
       @current = Rating.where(num_stars: 1).take
       i=1
      end
      if(rateVal == "2")
         @current = Rating.where(num_stars: 2).take
          i=1
        end
         if(rateVal == "3")
           @current = Rating.where(num_stars: 3).take
            i=1
        end
         if(rateVal == "4")
           @current = Rating.where(num_stars: 4).take
            i=1
        end
         if(rateVal == "5")
           @current = Rating.where(num_stars: 5).take
            i=1
        end
      @noTimes = @current.num_times_rated;
       if(@noTimes < 0 )
        @noTimes = 1
      else
        @noTimes = @noTimes + 1
      end
      if(i == 1)
      @current.update(num_times_rated:@noTimes )
    end
      redirect_to "/hosts/checkout"
    end
end
