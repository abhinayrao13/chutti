class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://chutti.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    format.html
  end

  def accepted_email(user,leave)
    @user = user
    @leave = leave
    mail(to: @user.email, subject: 'Leave request Accepted')
  end

  def declined_email(user,leave)
    @user = user
    @leave = leave
    mail(to: @user.email, subject: 'Leave request Declined')
  end

  def leave_request_email(user,leave)
    @user = user
    @leave = leave
    mail(to: "chuttikaboss@gmail.com", subject: 'Employee requested for leave')
  end
end
