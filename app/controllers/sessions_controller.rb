class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.try(:authenticate, params[:password])
      set_sesison @user
      r_dash
    else
      r_login "You have entered incorrect credentials!"
    end
  end

  def omniauth
    @user = User.omniauth_authenticate_or_create(auth)
    if @user.valid?
      set_sesison @user
      r_dash
    else
      r_login "Google Auth Failed"
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  def r_login(alert)
    redirect_to '/login', alert: alert
  end
  def r_dash
    redirect_to '/dashboard'
  end
  def set_sesison(user)
    session[:user_id] = user.id
  end
end
