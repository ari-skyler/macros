class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :check_setup_status

  private
  def check_setup_status
    if current_user && !current_user.setup
      redirect_to '/setup'
    end
  end
end
