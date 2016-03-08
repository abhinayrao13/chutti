module ApplicationHelper
  # checks if current user is admin
  def admin?
    if current_user.role.user_role.eql? "admin"
      return true
    else
      return false
    end
  end
  # redirects to dashboard if current user is not admin
  def admin
    if !current_user.role.user_role.eql? "admin"
      flash[:notice] = "You Are Not Authorized To Do This"
      redirect_to "/dashboard"
    end
  end

  # checks if the user is authorized to perform any action
  def authorized
   if current_user.id != params[:id].to_i
     flash[:notice] = "You Are Not Authorized To Do This"
     redirect_to "/dashboard"
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
