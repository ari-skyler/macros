class DaysController < ApplicationController
  before_action :check_credentials
  include DaysHelper
  def index
    @days = Day.all
  end

  def today
    @day = Day.find_or_create_by(date: Date.today, user_id: current_user.id)
    @yesterday = Day.find_by(date: Date.yesterday, user_id: current_user.id)
    @meals = current_user.meals
    @todays_meals = @day.meals
    @exercises = Exercise.all
    @workout = current_user.workouts.new(day: @day)
    @days_meal = @day.days_meals.new
  end

  def show
  end

  private

    def check_credentials
      if logged_in?
        @user = current_user
      else
        redirect_to '/login'
      end
    end
end
