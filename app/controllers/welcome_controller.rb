class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/dashboard'
    else
      redirect_to '/users'
    end
  end
end
