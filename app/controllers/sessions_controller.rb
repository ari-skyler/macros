class SessionsController < ApplicationController
  def new

  end
  def create
    @user = User.find_by(username: params[:username])
    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login', alert: "You have entered incorrect credentials"
    end
  end
end
