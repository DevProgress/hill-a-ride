class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://areyouwithher.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to AreYouWithHer')
  end
end
