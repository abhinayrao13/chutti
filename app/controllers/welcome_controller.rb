class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/notices'
    else
      redirect_to '/users'
    end
  end
end
