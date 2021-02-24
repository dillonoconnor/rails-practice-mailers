class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = "https://localhost:3000/"
    mail(to: @user.email, subject: "Welcome to the site!")
  end
end
