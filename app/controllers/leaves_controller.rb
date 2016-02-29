class LeavesController < ApplicationController
  before_action :leaves, only: [:create]
  def index
    if admin?
      @leave = Leave.where(status: "pending")
    else
      @leave = Leave.where(user_id: current_user.id)
    end
  end
  def new
    @leave = Leave.new
  end
  def create
    @leave = Leave.create(:reason_for_leave => params[:leave][:reason_for_leave], :user_id => current_user.id, :status => "pending", :leave_date_from => params[:leave][:leave_date_from].split("-")[0],:leave_date_to => params[:leave][:leave_date_from].split("-")[1])
      if(@leave.id != nil)
        respond_to do |format|
          format.html {redirect_to "/leaves"}
        end
      else
        render "/leaves/new"
      end
  end
  def edit
      @leave = Leave.find(params[:id])
  end
  def update
    @leave = Leave.find(params[:id])
    @leave.update(:reason_for_leave => params[:leave][:reason_for_leave], :status => "pending", :leave_date_from => params[:leave][:leave_date_from].split("-")[0],:leave_date_to => params[:leave][:leave_date_from].split("-")[1])
    respond_to do |format|
      format.html {redirect_to "/leaves"}
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
    respond_to do |format|
      format.html {redirect_to "/leaves"}
    end
  end
  def leave_status_decline
    @leave = Leave.find(params[:id])
    @leave.update(:status => "declined")
    respond_to do |format|
      format.html {redirect_to "/leaves"}
    end
  end
end


private
def leaves
  if current_user.max_leaves <= current_user.leaves.where(:status => "accepted").count
    return false
  else
    return true
  end
end
