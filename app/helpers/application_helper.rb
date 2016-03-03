module ApplicationHelper
  #checks if current user is signed in
  def admin?
    if current_user.role.user_role.eql? "admin"
      return true
    else
      return false
    end
  end
end
