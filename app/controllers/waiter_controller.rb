class WaiterController < ApplicationController
  before_action :require_waiter, only: [:tables, :postOrders , :takeOrder ,:orderStatus, :updateOrderStatus]
  protect_from_forgery

  def initialize 
  #	object = Table.new(:name => "a", :status => 0)
	#object.save
	#object = Meal.new(:name => "chicken BBQ pizza", :description => "with BBQ sause", :price => 40, :number_times_ordered => 0)
	#object.save
	#object = Meal.new(:name => "sausage pizza", :description => "with sausage", :price => 40, :number_times_ordered => 0)
	#object.save
	#object = Meal.new(:name => "chicken pizza", :description => "with chicken :D", :price => 40, :number_times_ordered => 0)
	#object.save
	#object = Meal.new(:name => "white sause pasta", :description => "with mashroom & chickes", :price => 50, :number_times_ordered => 0)
	#object.save
	#object = Meal.new(:name => "red sause pasta", :description => "with ay 7aga ba2a ", :price => 40, :number_times_ordered => 0)
	#object.save

end


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

def updateTimesMealOrdered(mealId)
  @meal = Meal.find(mealId)
  number_times_ordered = @meal[:number_times_ordered] +1 
  @meal.update(:number_times_ordered => number_times_ordered)
end

def orderStatus
  @orderStat = Order.select('id,status,meal_id,table_id').where(status: 1) 
end

def updateOrderStatus

  keyss = params[:order].keys
    i = 0
    while keyss[i] != nil
      @order = Order.find(keyss[i])
      @order.update(:status => 2)
      i = i+1
    end
    redirect_to "/waiter/tables"
  end
  
end
