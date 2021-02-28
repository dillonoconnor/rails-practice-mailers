class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = "https://localhost:3000/"
    mail(to: @user.email, subject: "Welcome to the site!")
  end

  def welcome_attachment
    @user = params[:user]
    @url = "https://localhost:3000/"
    attachments["welcome_pic.jpg"] = File.read(Rails.root + "app/assets/images/newegg_welcome.jpg")
    mail(to: @user.email, subject: "Here's the file you requested")
  end
end
