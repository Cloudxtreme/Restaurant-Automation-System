class SessionsController < ApplicationController

  def new
  end

  def create
  @employee = Employee.find_by_email(params[:session][:email])
  if @employee && @employee.authenticate(params[:session][:password])
    session[:employee_id] = @employee.id
    if session[:employee_id] == 1
    redirect_to '/waiter'
   elsif session[:employee_id] == 2
      redirect_to '/manager'
   elsif session[:employee_id] == 3
        redirect_to '/host'
   elsif session[:employee_id] == 4
          redirect_to '/cook'
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
