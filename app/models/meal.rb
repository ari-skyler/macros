class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients_meals, inverse_of: :meal
  has_many :ingredients, through: :ingredients_meals
  has_many :days_meals
  has_many :days, through: :days_meals
  accepts_nested_attributes_for :ingredients_meals
  validates :name, presence: true
  attr_accessor :nutrition, :ingredients_list
  def set_ingredients_list
    im = {}
    self.ingredients_meals.each do |i|
      im[i.ingredient_id] = i.servings
    end
    self.ingredients_list = self.ingredients.each do |i|
      i.servings = im[i.id]
    end
  end
  def set_nutrition
    hash = {:calories => 0, :fat => 0, :carbs => 0, :protein => 0, :fiber => 0, :sugar => 0}
    self.ingredients_list.each do |i|
      hash[:calories] += i.calories * i.servings
      hash[:fat] += i.fat * i.servings
      hash[:carbs] += i.carbs * i.servings
      hash[:protein] += i.protein * i.servings
      hash[:fiber] += i.fiber * i.servings
      hash[:sugar] += i.sugar * i.servings
    end
    self.nutrition = hash
  end
end
