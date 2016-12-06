class CookController < ApplicationController
  before_action :require_cook, only: [:postOrder, :orders ]
  protect_from_forgery

  def orders
  	@orders = Order.where("status": 0)
  end


  def postOrder
  	done = params[:order].keys
  	updateOrderStatus(done)
  	redirect_to "/cook/orders"
  end

  def updateOrderStatus(done)
    for i in 0..done.length-1
      @order = Order.find(done[i])
      @order.update(:status => 1)
    end
  end

end
