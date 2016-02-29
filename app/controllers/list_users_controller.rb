class ListUsersController < ApplicationController
  before_action :admin?

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(max_leaves: params[:user][:max_leaves])
    redirect_to "/listusers"
  end

  def delete
    @user = User.find(params[:id])
    @user.delete
    redirect_to "/listusers"
  end
end
