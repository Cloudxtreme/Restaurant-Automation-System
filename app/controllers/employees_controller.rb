class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      session[:employee_id] = @employee.id
      if @employee.id == 1
       redirect_to 'waiter'
     elsif @employee.id == 2
       redirect_to 'manager'
     elsif @employee.id == 3
       redirect_to 'host'
     elsif @employee.id == 4
       redirect_to 'cook'
     end

    else
      redirect_to '/login'
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :position, :email, :password)
  end

end
