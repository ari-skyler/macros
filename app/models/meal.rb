class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients_meals, inverse_of: :meal
  has_many :ingredients, through: :ingredients_meals
  has_many :meals_days
  accepts_nested_attributes_for :ingredients_meals
end
