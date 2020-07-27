class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @meal = Meal.new
    @meal.ingredients_meals.build.build_ingredient
    @ingredients = Ingredient.all
  end

  def edit
  end

  def create
    day = Day.find_by(date: Date.today)
    days_meal = day.days_meals.build
    meal = Meal.new(meal_params)
    days_meal.meal = meal
    meal.user = current_user
    if meal.valid?
      meal.save
      days_meal.save
      redirect_to '/today'
    else
      redirect_to new_meal_path
    end
  end

  def update

  end

  def destroy

  end

  private
    def set_meal
      @meal = Meal.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:user_id, :name, :descritpion, ingredients_meals_attributes: [:servings, :ingredient_id, ingredient_attributes: [:name, :calories, :protein, :carbs, :fat, :fiber, :sugar]])
    end

    def delete_if_empty(hash, value)
      byebug
      hash.delete value if hash[value].any? &:empty?
    end
end
