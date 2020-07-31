class Ingredient < ApplicationRecord
  has_many :ingredients_meals
  has_many :meals, through: :ingredients_meals
  validates_presence_of :name, :calories, :protein, :fat, :carbs, :fiber, :sugar

  def servings=(num)
    @servings = num
  end

  def servings
    @servings
  end
end
