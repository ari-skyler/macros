class CreateJoinTableMealIngredient < ActiveRecord::Migration[5.2]
  def change
    create_join_table :meals, :ingredients do |t|
      t.index :meal_id
      t.index :ingredient_id
      t.integer :servings
    end
  end
end
