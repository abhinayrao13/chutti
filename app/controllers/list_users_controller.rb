class ListUsersController < ApplicationController
  before_action :admin?

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
    if current_user != @user
      @user.delete
    end
    redirect_to "/list_users"
  end
  private

  def user_params
    params.require(:user).permit(:email, :name, :gender, :phone_no, :role_id, :max_leaves, :image)
  end
end
