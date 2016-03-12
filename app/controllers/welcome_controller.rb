class WelcomeController < ApplicationController
  def index
    if user_signed_in? && admin?
      redirect_to '/dashboard'
    elsif user_signed_in? && !admin?
      redirect_to '/notices'
    else
      redirect_to '/users/sign_in'
    end
  end
end
