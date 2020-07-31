class DaysController < ApplicationController
  before_action :check_credentials
  def index
    @days_calories = [{name: "Goal", data: {}}, {name: "Actual", data: {}}]
    @days_weight = [{name: "Weight", data: {}}]
    @nutrition_breakdown = {:fat => 0, :carbs => 0, :protein => 0, :fiber => 0, :sugar => 0}
    @days = Day.where(user: current_user).limit(30).find_each do |day|
      @days_calories[1][:data][day.date] = day.net_calories
      @days_calories[0][:data][day.date] = current_user.nutrition[:calories]
      @days_weight[0][:data][day.date] = day.weight
      @nutrition_breakdown = @nutrition_breakdown.merge(day.nutrition){|k, v, vv| v + vv if k != :calories}
    end
    @nutrition_breakdown[:carbs] = @nutrition_breakdown[:carbs] - @nutrition_breakdown[:fiber] -@nutrition_breakdown[:sugar]
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
