class WaitersController < ApplicationController
  before_action :require_waiter, only: [:new]
  def new
  end
end
