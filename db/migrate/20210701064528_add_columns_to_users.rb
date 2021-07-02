class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :experience, :integer,default: 0
    add_column :users, :user_level, :integer,default: 1
  end
end
