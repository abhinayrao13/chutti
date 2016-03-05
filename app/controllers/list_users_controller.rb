class ListUsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    if !admin?
      redirect_to "/dashboard"
    end
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    if !admin?
      redirect_to "/dashboard"
    end
    @user = User.new(user_params);
    @user.image_uid = "default-logo-300x300.png"
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      redirect_to "/list_users"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/dashboard"
    else
      render "edit"
    end
  end

  def delete
    @user = User.find(params[:id])
    if current_user != @user && admin?
      @user.delete
    end
    redirect_to "/list_users"
  end

  def cancel
    @user = User.find(params[:id])
    @user.delete
    redirect_to "/users/sign_in"
  end


  def employee_leaves_checkinouts
    @leave_details = Leave.where(:user_id => params[:id])
    @checkin_details = Checkin.where(:user_id => params[:id])
  end
  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :gender, :phone_no, :role_id, :max_leaves, :image)
  end
end
