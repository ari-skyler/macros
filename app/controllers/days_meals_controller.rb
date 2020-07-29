class DaysMealsController < ApplicationController

  def create
    days_meal = DaysMeal.new(days_meal_params)
    days_meal.day = Day.find_by(date: Date.today)
    if days_meal.valid?
      days_meal.save
      redirect_to '/today'
    else
      redirect_to '/today'
    end
  end

  private

    def days_meal_params
      params.require(:days_meal).permit(:meal_id)
    end
end
