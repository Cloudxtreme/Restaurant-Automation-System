class HostsController < ApplicationController
  before_action :require_host, only: [:new]

  def new
  end
end
