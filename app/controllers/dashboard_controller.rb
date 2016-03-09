class DashboardController < ApplicationController
  before_action :admin
  def index
    @pending_leaves = Leave.where(status: "pending").reverse
    @all_dates_checkins = []
    @dates =  Checkin.select(:date).uniq.reverse
    @dates.each { |x|  @all_dates_checkins << {x.date => Checkin.where(:date => x.date).reverse}}
  end
end
