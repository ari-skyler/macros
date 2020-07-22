class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :descritpion

      t.timestamps
    end
  end
end
