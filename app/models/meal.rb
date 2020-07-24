class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients_meals, inverse_of: :meal
  has_many :ingredients, through: :ingredients_meals
  has_many :meals_days
  accepts_nested_attributes_for :ingredients_meals

  def ingredients_list
    im = {}
    self.ingredients_meals.each do |i|
      im[i.ingredient_id] = i.servings
    end
    self.ingredients.each do |i|
      i.servings = im[i.id]
    end
  end
end
