class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_ingredients
  has_many :ingredients, through: :meals_ingredients
  has_many :meals_days
end
