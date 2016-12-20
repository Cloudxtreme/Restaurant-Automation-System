class WaiterController < ApplicationController
  before_action :require_waiter, only: [:tables, :postOrders , :takeOrder ,:orderStatus, :updateOrderStatus]
  protect_from_forgery



def saveOrder( table_id,mealId)
  object = Order.new(:status => 0 , :table_id => table_id , :meal_id => mealId)
  object.save
end

def tables
 @tables = Table.all
end

def takeOrder
 @meals = Meal.all

 @table_id = params[:tableId]

end

def postOrders
  if params[:orders].nil?
  else
  meals = params[:orders].keys
  quantity = params[:repitations]
  table_id = params[:table_id]
  puts table_id
  for i in 0..meals.length-1
    mealId = meals[i]
    for j in 1..quantity[meals[i]].to_i
      saveOrder(table_id, mealId)
      updateTimesMealOrdered(mealId)
    end
  end
  redirect_to "/waiter/tables"
  end
end

def updateTimesMealOrdered(mealId)
  @meal = Meal.find(mealId)
  number_times_ordered = @meal[:number_times_ordered] +1
  @meal.update(:number_times_ordered => number_times_ordered)
end

def orderStatus
  @orderStat = Order.select('id,status,meal_id,table_id').where(status: 1)
end

def updateOrderStatus
if params[:order].nil?
else
  keyss = params[:order].keys
    i = 0
    while keyss[i] != nil
      @order = Order.find(keyss[i])
      @order.update(:status => 2)
      i = i+1
    end
  end
  redirect_to "/waiter/tables"

  end

end
