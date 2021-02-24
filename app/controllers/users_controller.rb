class UsersController < ApplicationController
  def index
    
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation);
    end
end
