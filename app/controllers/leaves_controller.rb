class LeavesController < ApplicationController
  before_action :leaves, only: [:new]
  def index
    if admin?
      @leaves = Leave.where(user_id: params[:format])
    else
      @leaves = Leave.where(user_id: current_user.id)
    end
  end
  def admin_index
      #@leaves = Leave.where(status: "pending")
      @response = []
      @leaves = Leave.where(status: "pending")
      @leaves.each {|leave| @response << {title: leave.user.name, start: leave.leave_date_from.to_time.iso8601, end: ((leave.leave_date_to)+ 1).to_time.iso8601 , url: "/leaves/#{leave.id}/leave_decision"} }
      @users = @leaves.collect{|l| l.user.name}
      respond_to do |format|
        puts "responding with json"
        format.json {render json: {:leaves => @leaves, :users => @users}}
        format.html {render "/leaves/admin_index"}
      end
  end
  def new
    @leave = Leave.new
  end
  def create
    @leave = Leave.create(:reason_for_leave => params[:leave][:reason_for_leave], :user_id => current_user.id, :status => "pending", :leave_date_from => params[:leave][:leave_date_from].to_date,:leave_date_to => params[:leave][:leave_date_to].to_date)
      if(@leave.id != nil)
        @user = @leave.user
        UserMailer.leave_request_email(@user,@leave).deliver_now
        respond_to do |format|
          format.html {redirect_to "/leaves"}
        end
      else
        render "/leaves/new"
      end
  end
  def edit
      @leave = Leave.find(params[:id])
      # render partial: "newedit"
  end
  def update
    @leave = Leave.find(params[:id])
    @leave.update(:reason_for_leave => params[:leave][:reason_for_leave], :user_id => current_user.id, :status => "pending", :leave_date_from => params[:leave][:leave_date_from].to_date,:leave_date_to => params[:leave][:leave_date_to].to_date)
    respond_to do |format|
      if admin?
        format.html {redirect_to "/leaves/#{@leave.id}/leave_decision"}
      else
        format.html {redirect_to "/leaves"}
     end
    end
  end
  def destroy
    @leave =  Leave.delete(params[:id])
    respond_to do |format|
      format.html {redirect_to "/leaves"}
    end
  end
  # def maximum_leaves
  #   @maximunleaves = User.find(current_user.id).leaves.count
  # end
  # def pending_leaves
  #   @pending_leaves = Leave.where(status: "pending")
  # end
  def leave_status_accept
    @leave = Leave.find(params[:id])
    @leave.update(:status => "accepted")
    @user = @leave.user
    UserMailer.accepted_email(@user,@leave).deliver_now
    respond_to do |format|
      format.html {redirect_to "/leaves/admin_index"}
    end
  end
  def leave_status_decline
    @leave = Leave.find(params[:id])
    @leave.update(:status => "declined")
    @user = @leave.user
    UserMailer.declined_email(@user,@leave).deliver_now
    respond_to do |format|
      format.html {redirect_to "/leaves/admin_index"}
    end
  end
  def leave_decision
    @leave = Leave.find(params[:id])
    # respond_to do |format|
    #   format.html {redirect_to "/leaves/admin_index"}
    # end
  end
end


private
def leaves
  if current_user.max_leaves == current_user.leaves.where(:status => "accepted").count
    redirect_to "/leaves"
  end
end
