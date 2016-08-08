class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://areyouwithher.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to AreYouWithHer')
  end

  def ride_request_email

  end

  def ride_request_accepted_email

  end
  
end
