class ManagersController < ApplicationController
  before_action :require_manager, only: [:new]

  def new
  end
end
