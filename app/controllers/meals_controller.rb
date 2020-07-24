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
  end

  def edit
  end

  def create
    meal = current_user.meals.build(meal_params)
    if meal.valid?
      meal.save
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
      params.require(:meal).permit(:user_id, :name, :descritpion, ingredients_meals_attributes: [:servings, ingredient_attributes: [:name, :calories]])
    end
end
