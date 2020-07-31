class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end
  def new
    @ingredient = Ingredient.new
  end
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end
  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.assign_attributes(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end
  def destroy
    Ingredient.destroy(params[:id])
    redirect_to ingredients_path
  end
  private

    def ingredient_params
      params.require(:ingredient).permit(:name, :calories, :protein, :fat, :carbs, :fiber, :sugar)
    end
end
