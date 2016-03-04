module CheckinsHelper
  # Checks if the current user checked in today.
  def checked_in
    @current_user_id = current_user.id
    @current_date = Date.today
    @checked_in_user = Checkin.where(user_id: @current_user_id, date: @current_date).last
    if @checked_in_user != nil && @checked_in_user.check_in != nil && @checked_in_user.check_out != nil
      return "recheck"
    elsif @checked_in_user != nil && @checked_in_user.check_in != nil && @checked_in_user.check_out == nil
      return true
    else
      return false
    end
  end
end
