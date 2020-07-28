class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.references :user
      t.integer :amount
      t.references :day
      t.references :exercise
      t.timestamps
    end
  end
end
