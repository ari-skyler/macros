class CreateJoinTableDatesMeals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dates, :meals do |t|
      t.index :date_id
      t.index :meal_id
    end
  end
end
