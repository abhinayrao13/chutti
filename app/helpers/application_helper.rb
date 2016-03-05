module ApplicationHelper
  #checks if current user is signed in
  def admin?
    if current_user.role.user_role.eql? "admin"
      return true
    else
      return false
    end
  end

# def fsdfsdf(leave)
#   if leave.leave_date_from.present?
#    leave.leave_date_from + "-" + leave.leave_date_to
#  else
#    ""
#  end
# end

def set_leave_dates(leave)
  if leave.leave_date_from.present? && leave.leave_date_from.present?
    "#{@leave.leave_date_from.strftime("%d/%m/%Y")} - #{@leave.leave_date_to.strftime("%d/%m/%Y")}"
  else
    ""
  end
end

end
