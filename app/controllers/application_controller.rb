class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_employee
   helper_method :current_manager
   helper_method :current_cook
   helper_method :current_host
   helper_method :current_waiter



  def current_employee
  @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
  def current_manager
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
    if  @current_employee.position.eql? 'manager'
        @current_manager ||= Employee.find(session[:employee_id]) if session[:employee_id]
   end
  end
  def current_waiter
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
    if   @current_employee.position.eql? 'waiter'
        @current_waiter ||= Employee.find(session[:employee_id]) if session[:employee_id]
   end
  end
  def current_cook
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
    if   @current_employee.position.eql? 'cook'
        @current_cook ||= Employee.find(session[:employee_id]) if session[:employee_id]
   end
  end
  def current_host
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
    if   @current_employee.position.eql? 'host'
        @current_host ||= Employee.find(session[:employee_id]) if session[:employee_id]
   end
  end

  def require_employee
      if current_employee

      else
          redirect_to '/login'
      end
  end
  def require_manager
      if current_manager

      else
          redirect_to '/login'
      end
  end
  def require_waiter
      if current_waiter

      else
          redirect_to '/login'
      end
  end
  def require_cook
      if current_cook

      else
          redirect_to '/login'
      end
  end
  def require_host
      if current_host

      else
          redirect_to '/login'
      end
  end
end
