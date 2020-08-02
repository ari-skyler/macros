class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :check_setup_status

  private
  def check_setup_status
    redirect_to '/setup' if current_user && !current_user.setup
  end
end
