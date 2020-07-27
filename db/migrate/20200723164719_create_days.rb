class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :date
      t.references :user
      t.references :workout
    end
  end
end
