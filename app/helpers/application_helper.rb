module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(sesison[:user_id])
  end
  def logged_in?
    !!current_user
  end
end
