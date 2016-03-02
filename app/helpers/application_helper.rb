module ApplicationHelper
  #checks if current user is signed in
  def admin?
    if current_user.role.user_role.eql? "admin"
      return true
    else
      return false
    end
  end

  # Checks if the current user checked in today.
  def checked_in
    @current_user_id = current_user.id
    @current_date = Date.today
    @checked_in_user = Checkin.where(user_id: @current_user_id, date: @current_date).first
    if @checked_in_user != nil && @checked_in_user.check_in != nil && @checked_in_user.check_out != nil
      return "disable"
    elsif @checked_in_user != nil && @checked_in_user.check_in != nil
      return true
    else
      return false
    end
  end
end
