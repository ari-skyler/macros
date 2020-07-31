class CreateJoinTableMealIngredient < ActiveRecord::Migration[5.2]
  def change
    create_join_table :meals, :ingredients do |t|
      t.index [:meal_id, :ingredient_id], :unique => true
      t.index [:ingredient_id, :meal_id], :unique => true
      t.integer :servings
    end
  end
end
