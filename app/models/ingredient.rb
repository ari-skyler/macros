class Ingredient < ApplicationRecord
  has_many :ingredients_meals
  has_many :meals, through: :ingredients_meals

  def servings=(num)
    @servings = num
  end
  
  def servings
    @servings
  end
end
