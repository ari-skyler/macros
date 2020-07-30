class UsersController < ApplicationController
  skip_before_action :check_setup_status, only: [:setup, :update]
  def new
    @user = User.new
  end
  def setup
    @user = current_user

  end
  def create
    @user = User.new(user_params)
    if @user.valid?(:setup)
      redirect_to '/dashboard'
    else
      render :new
    end
  end
  def update
    @user = current_user
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.setup = true
      @user.save
      redirect_to '/dashboard'
    else
      render :setup
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :calories_target, :protein_target, :fat_target, :carbs_target, :fiber_target, :sugar_target, :gender, :weight)
  end
end
