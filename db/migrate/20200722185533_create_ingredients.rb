class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :fiber
      t.integer :sugar
      t.text :descritpion

      t.timestamps
    end
  end
end
