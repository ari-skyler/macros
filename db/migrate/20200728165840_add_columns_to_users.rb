class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :calories_target, :integer
    add_column :users, :protein_target, :integer
    add_column :users, :fat_target, :integer
    add_column :users, :carbs_target, :integer
    add_column :users, :fiber_target, :integer
    add_column :users, :sugar_target, :integer
  end
end
