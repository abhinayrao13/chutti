class LeavesController < ApplicationController
  def index
    @leave = Leave.all
  end
  def new
    @leave = Leave.new
  end
  def create
    p params
      @leave = Leave.create(:reason_for_leave => params[:leave][:reason_for_leave], :user_id => params[:leave][:user_id], :status => "pending", :leave_date_from => params[:leave][:leave_date_from].split("-")[0],:leave_date_to => params[:leave][:leave_date_from].split("-")[1])
      respond_to do |format|
      format.html {redirect_to "/leaves"}
      end
  end
  def edit
      @leave = Leave.find(params[:id])
      p "================="
      p @leave
  end
  def update
    @leave = Leave.find(params[:id])
    @leave.update(:reason_for_leave => params[:leave][:reason_for_leave], :user_id => params[:leave][:user_id], :status => "pending", :leave_date_from => params[:leave][:leave_date_from].split("-")[0],:leave_date_to => params[:leave][:leave_date_from].split("-")[1])
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
end
