class ChangeColumnInExercises < ActiveRecord::Migration[5.2]
  def change
    change_column :exercises, :calories_burned, :float
  end
end
