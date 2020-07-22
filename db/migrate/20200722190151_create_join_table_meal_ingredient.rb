class CreateJoinTableMealIngredient < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_ingredients do |t|
      t.references :meal
      t.references :ingredient
      t.integer :servings
    end
  end
end
