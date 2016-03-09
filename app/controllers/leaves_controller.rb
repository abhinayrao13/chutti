class LeavesController < ApplicationController
  before_action :leaves, only: [:new]
  before_action :admin, only: [:leave_decision ,:admin_index]
  def index
    @leaves = Leave.where(user_id: current_user.id)
  end
  def admin_index
    @response = []
    @pending_leaves = Leave.where(status: "pending")
    @accepted_leaves = Leave.where(status: "accepted")
    @rejected_leaves = Leave.where(status: "declined")
    @pending_leaves.each {|leave| @response << {title: leave.user.name, start: leave.leave_date_from.to_time.iso8601, end: ((leave.leave_date_to)+ 1).to_time.iso8601 , url: "/leaves/#{leave.id}/leave_decision", color: '#e6ac00' } }
    @accepted_leaves.each {|leave| @response << {title: leave.user.name, start: leave.leave_date_from.to_time.iso8601, end: ((leave.leave_date_to)+ 1).to_time.iso8601 , url: "/leaves/#{leave.id}/leave_decision", color: 'green' } }
    @rejected_leaves.each {|leave| @response << {title: leave.user.name, start: leave.leave_date_from.to_time.iso8601, end: ((leave.leave_date_to)+ 1).to_time.iso8601 , url: "/leaves/#{leave.id}/leave_decision", color: 'red' } }
    respond_to do |format|
      format.html {render "/leaves/admin_index"}
    end
  end
  def new
    @leave = Leave.new
  end
  def create
    @leave = Leave.create(:reason_for_leave => params[:leave][:reason_for_leave], :user_id => current_user.id, :status => "pending", :leave_date_from => params[:leave][:leave_date_from].to_date,:leave_date_to => params[:leave][:leave_date_to].to_date)
      if(@leave.id != nil)
        flash[:notice] = "Leave Created Successfully"
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
    if (current_user.id == Leave.find(params[:id]).user_id) || (current_user.role.user_role == "admin")
       @leave = Leave.find(params[:id])
    else
      flash[:notice] = "You Are Not Authorized To Do This"
      redirect_to "/dashboard"
    end
  end
  def update
    @leave = Leave.find(params[:id])
    @leave.update(:reason_for_leave => params[:leave][:reason_for_leave], :user_id => current_user.id, :status => "pending", :leave_date_from => params[:leave][:leave_date_from].to_date,:leave_date_to => params[:leave][:leave_date_to].to_date)
    flash[:notice] = "Leave Updated Successfully"
    respond_to do |format|
      if admin?
        format.html {redirect_to "/leaves/#{@leave.id}/leave_decision"}
      else
        format.html {redirect_to "/leaves"}
     end
    end
  end
  def destroy
    if current_user.id != (Leave.find(params[:id])).user_id
      flash[:notice] = "You Are Not Authorized To Do This"
       redirect_to "/dashboard"
    else
      @leave =  Leave.delete(params[:id])
      respond_to do |format|
        format.html {redirect_to "/leaves"}
      end
    end
  end
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
  end
end


private
# to check the maximum leave requests of the employee accepted by the admin
def leaves
  if current_user.max_leaves == (current_user.leaves.where(:status => "accepted").count + current_user.leaves.where(:status => "pending").count)
    flash[:notice] = "Sorry , Your Leaves Have been Completed"
    redirect_to "/leaves"
  end
end
