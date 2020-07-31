class IngredientsMealsController < ApplicationController
  def destroy
    Meal.find(params[:meal_id]).ingredients.delete(params[:ingredient_id])
    redirect_to "/meals/#{params[:meal_id]}/edit"
  end
end
