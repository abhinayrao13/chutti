class ListUsersController < ApplicationController
  before_action :admin?

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
    @user = User.new(user_params);
    if @user.save
      redirect_to "/list_users"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(max_leaves: params[:user][:max_leaves])
    redirect_to "/list_users"
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
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :gender, :phone_no, :role_id, :max_leaves)
  end
end
