class ListUsersController < ApplicationController
  before_action :admin, except: [:edit, :update, :cancel, :employee_leaves_checkinouts]
  before_action :authorized, except: [:create, :delete, :index, :new, :employee_leaves_checkinouts]
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.image_uid = "icon-user-default.png"
    if @user.save
      flash[:notice] = "New Employee successfully added."
      UserMailer.welcome_email(@user).deliver_now
      redirect_to "/list_users"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Details Updated Successfully."
      redirect_to "/notices"
    else
      render "edit"
    end
  end

  def delete
    @user = User.find(params[:id])
    if current_user.id != @user.id
      @user.delete
      flash[:notice] = "Deleted Successfully."
    end
    redirect_to "/list_users"
  end

  def cancel
    @user = User.find(params[:id])
    @user.delete
    redirect_to "/users/sign_in"
  end


  def employee_leaves_checkinouts
    @user = User.find(params[:id].to_i)
    @leave_details = Leave.where(:user_id => params[:id])
    @checkin_details = Checkin.where(:user_id => params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :gender, :phone_no, :role_id, :max_leaves, :image)
  end
end
