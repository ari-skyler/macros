class MealsController < ApplicationController

  def index
    @meals = current_user.meals
  end

  def new
    @meal = Meal.new
    @meal.ingredients_meals.build.build_ingredient
    @ingredients = Ingredient.all
    @post_url = "/days/#{params[:date]}/meals"
  end

  def create
    day = Day.find_by(date: params[:date], user: current_user)
    @post_url = "/days/#{params[:date]}/meals"
    days_meal = day.days_meals.build
    @meal = Meal.new(meal_params)
    @ingredients = Ingredient.all
    days_meal.meal = @meal
    @meal.user = current_user
    if @meal.valid?
      @meal.save
      days_meal.save
      redirect_to "/days/#{params[:date]}"
    else
      render :new
    end
  end

  def edit
    @meal = Meal.find(params[:id])
    @ingredients = Ingredient.all
    @post_url = "/meals/#{params[:id]}"
  end

  def destroy
    Meal.destroy(params[:id])
    redirect_to meals_path
  end

  private
    def meal_params
      params.require(:meal).permit(:user_id, :name, :descritpion, ingredients_meals_attributes: [:servings, :ingredient_id, ingredient_attributes: [:name, :calories, :protein, :carbs, :fat, :fiber, :sugar]])
    end
end
