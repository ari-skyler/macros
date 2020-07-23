class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]
  before_action :check_credentials
  def index
    @days = Day.all
  end

  def show
  end

  def new
    @day = Day.new
  end

  def edit
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

    def set_day
      @day = Day.find(params[:id])
    end

    def day_params
      params.fetch(:day, {})
    end

    def check_credentials
      if logged_in?
        @user = current_user
      else
        redirect_to '/login'
      end
    end
end
