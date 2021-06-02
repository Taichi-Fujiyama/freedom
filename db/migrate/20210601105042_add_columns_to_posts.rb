class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :appointed_user_id, :integer
    add_column :posts, :status, :string
    add_column :posts, :priority, :string
  end
end
