class DashboardController < ApplicationController

  def index
    @notice = Notice.all
  end

end
