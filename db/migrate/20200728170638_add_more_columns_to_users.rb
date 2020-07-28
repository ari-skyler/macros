class AddMoreColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :weight, :integer
    add_column :users, :gender, :string
  end
end
