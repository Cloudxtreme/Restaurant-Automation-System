class SessionsController < ApplicationController

  def new
  end

  def create
  @employee = Employee.find_by_email(params[:session][:email])
  if @employee && @employee.authenticate(params[:session][:password])
    session[:employee_id] = @employee.id
    if  @employee.position.eql? 'waiter'
      redirect_to '/waiter/tables'
  elsif @employee.position.eql? 'manager'
      redirect_to '/manager/main'
   elsif @employee.position.eql? 'host'
      redirect_to '/host'
   elsif  @employee.position.eql? 'cook'
      redirect_to '/cook/orders'
   end
  else
    redirect_to '/login'
  end
  end

  def destroy
  session[:employee_id] = nil
  redirect_to '/login'
  end

end
