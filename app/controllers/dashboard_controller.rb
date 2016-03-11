class DashboardController < ApplicationController
  before_action :admin
  def index
    @pending_leaves = Leave.where(status: "pending").reverse
    @desc_checkins = Checkin.all
    @users = User.where(:id => @desc_checkins.collect{|x| x.user_id}).collect{|x| {x.id => {url: x.image.url, name: x.name}}}.reduce( Hash.new, :merge)
    @desc_checkins = [@desc_checkins.as_json.each{|x| x["type"] = "check_in"} + @desc_checkins.select{|x| x.check_out != nil}.as_json.each{|x| x["type"] = "check_out"}].flatten.sort{|x,y| x["date"] <=> y["date"]}.reverse
    @desc_checkins = @desc_checkins.as_json
    @before_paginate_checkins = @desc_checkins
    @desc_checkins = Kaminari.paginate_array(@desc_checkins).page(params[:page]).per(3)
    @index = @before_paginate_checkins.index @desc_checkins[0]
    #p @before_paginate_checkins
    #p @desc_checkins
    #p @before_paginate_checkins[@index - 1]["date"] == @before_paginate_checkins[@index]["date"]
    @current_date_rendered = @before_paginate_checkins[@index - 1]["date"] == @before_paginate_checkins[@index]["date"]
  end

end
