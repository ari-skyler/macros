class AddColumnsToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :calories_burned, :integer
  end
end
