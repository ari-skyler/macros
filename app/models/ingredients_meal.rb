class IngredientsMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient
  
  accepts_nested_attributes_for :ingredient, reject_if: :all_blank
end
