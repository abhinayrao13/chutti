class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/notices'
    else
      redirect_to '/users/sign_in'
    end
  end
end
