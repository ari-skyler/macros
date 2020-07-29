class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    @user.try(:authenticate, params[:password]) ? (login @user) : (r_login "You have entered incorrect credentials!")
  end

  def omniauth
    @user = User.omniauth_authenticate_or_create(auth)
    @user.valid? ? (login @user) : (r_login "Google Auth Failed")
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
  private

  def auth
    request.env['omniauth.auth']
  end

  def r_login(alert)
    redirect_to '/login', alert: alert
  end

  def login(user)
    session[:user_id] = user.id
    redirect_to '/dashboard'
  end

end
