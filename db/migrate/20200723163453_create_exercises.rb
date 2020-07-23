class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.boolean :time_based
      t.string :name

      t.timestamps
    end
  end
end
