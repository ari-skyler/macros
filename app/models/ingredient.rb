class Ingredient < ApplicationRecord
  has_many :meal_ingredients
  has_many :meals, through: :meals_ingredients
end
