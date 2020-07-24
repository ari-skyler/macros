class Ingredient < ApplicationRecord
  has_many :ingredients_meals
  has_many :meals, through: :ingredients_meals
end
