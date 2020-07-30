class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def setup
    @user = current_user

  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      redirect_to '/dashboard'
    else
      render :new
    end
  end
  def update
    
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
