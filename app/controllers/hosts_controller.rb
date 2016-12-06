class HostsController < ApplicationController
  before_action :require_host, only: [:new ]

  def new
    @avail_tables =   Table.where(status:0 )
    @busy_tables =   Table.where(status:1 )
  end


end
