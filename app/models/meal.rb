class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients_meals, inverse_of: :meal
  has_many :ingredients, through: :ingredients_meals
  has_many :days_meals
  has_many :days, through: :days_meals, dependent: :destroy

  accepts_nested_attributes_for :ingredients_meals

  validates :name, presence: true

  attr_accessor :nutrition, :ingredients_list

  def ingredients_list
    if @ingredients_list.nil?
      im = {}
      self.ingredients_meals.each do |i|
        im[i.ingredient_id] = i.servings
      end
      @ingredients_list = self.ingredients.each do |i|
        i.servings = im[i.id]
      end
    end
    @ingredients_list
  end

  def nutrition
    if @nutrition.nil?
      hash = {:calories => 0, :fat => 0, :carbs => 0, :protein => 0, :fiber => 0, :sugar => 0}
      self.ingredients_list.each do |i|
        hash[:calories] += i.calories * i.servings
        hash[:fat] += i.fat * i.servings
        hash[:carbs] += i.carbs * i.servings
        hash[:protein] += i.protein * i.servings
        hash[:fiber] += i.fiber * i.servings
        hash[:sugar] += i.sugar * i.servings
      end
      @nutrition = hash
    end
    @nutrition
  end
end
