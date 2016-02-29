module ApplicationHelper
  def admin?
    if current_user.role.user_role.eql? "admin"
      return true
    else
      return false
    end
  end
end
