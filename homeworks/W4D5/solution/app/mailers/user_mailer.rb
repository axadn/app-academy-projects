class UserMailer < ApplicationMailer
  default from: 'adanmarrufo@gmail.com'

  def welcome_email(user)
    @user_name = user.username
    @login_url = "localhost:3000/session/new"
    mail(to: "adanmarrufo@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
