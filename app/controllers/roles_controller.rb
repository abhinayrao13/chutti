class RolesController < ApplicationController
  before_action :admin

  def index
    @role = Role.all
  end
  def new
    @role = Role.new
  end
  def create
    @role = Role.create(:user_role =>params[:role][:user_role])
    redirect_to "/roles"
  end
  def destroy

    @role = Role.destroy(params[:id])
    respond_to do |format|
      puts "responding with json"
      format.json {render json: @role}
      #render :json => {:login => @login}
    end
  end
  def edit
      @role = Role.find(params[:id])
  end
  def update
      @role = Role.find(params[:id])
      @role.update(:user_role =>params[:role][:user_role])
      respond_to do |format|
          format.html {redirect_to "/roles"}
      end
  end
end
