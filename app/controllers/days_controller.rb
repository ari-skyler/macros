class DaysController < ApplicationController
  before_action :check_credentials
  def index
    overview = Day.thirty_day_overview(current_user)
    @days_calories = overview[:days_calories]
    @days_weight = overview[:days_weight]
    @nutrition_breakdown = overview[:nutrition_breakdown]
  end

  def show
    date = params[:date].to_date
    @day = Day.find_or_create_by(date: date, user_id: current_user.id)
    @yesterday = Day.find_or_create_by(date: date - 1.day, user_id: current_user.id)
    @meals = current_user.meals
    @todays_meals = @day.meals.includes(ingredients_meals: [:ingredient])
    @exercises = Exercise.all
    @workout = current_user.workouts.new(day: @day)
    @days_meal = @day.days_meals.new
  end

  def update
    day = Day.find(params[:id])
    day.weight = params[:day][:weight]
    current_user.update(weight: day.weight)
    day.save
    redirect_to "/days/#{day.date}"
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
