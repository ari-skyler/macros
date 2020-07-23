class CreateJoinTableDaysMeals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :days, :meals do |t|
      t.index :day_id
      t.index :meal_id
      t.string :meal_type
    end
  end
end
