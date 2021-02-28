class UsersController < ApplicationController
  def index
    
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.with(user: @user).welcome_email.deliver_later
      redirect_to root_path, notice: "Successfully signed up.  Please check your email."
    else
      render :new
      flash.now[:alert]  = "An error occurred.  Please try again."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def file_mailer
    if current_user
      UserMailer.with(user: @current_user).welcome_attachment.deliver_later
      redirect_to root_url, notice: "File sent!"
    else
      flash.now[:alert] = "Must be logged in"
      render :index
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation);
    end
end
