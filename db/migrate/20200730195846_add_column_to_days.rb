class AddColumnToDays < ActiveRecord::Migration[5.2]
  def change
    add_column :days, :weight, :integer
  end
end
