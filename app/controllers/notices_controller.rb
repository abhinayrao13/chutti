class NoticesController < ApplicationController
  def index
    @notice = Notice.all
  end
  def new
    @notice = Notice.new
  end
  def create
    @notice = Notice.create(:subject => params[:notice][:subject ], :content => params[:notice][:content], :user_id => current_user.id)
    if(@notice.id != nil)
      respond_to do |format|
        format.html {redirect_to "/notices"}
      end
    else
      render "/notices/new"
    end
  end
  def edit
    @notice = Notice.find(params[:id])
  end
  def show
    @notice = Notice.find(params[:id])
  end
  def update
    @notice = Notice.find(params[:id])
    @notice.update(:subject => params[:notice][:subject ], :content => params[:notice][:content], :user_id => current_user.id)
    respond_to do |format|
      format.html {redirect_to "/notices"}
    end
  end
  def destroy
    @notice = Notice.delete(params[:id])
    respond_to do |format|
      format.html {redirect_to "/notices"}
    end
  end
end
