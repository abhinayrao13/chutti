class ListUsersController < ApplicationController
  skip_before_action :admin?, only: [:update]

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
    @user.update(user_params)
    p "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    p @user.errors
    p "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    redirect_to "/dashboard"
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
