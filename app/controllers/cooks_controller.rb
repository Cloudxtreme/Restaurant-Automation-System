class CooksController < ApplicationController
  before_action :require_cook, only: [:new]
  def new
  end
end
