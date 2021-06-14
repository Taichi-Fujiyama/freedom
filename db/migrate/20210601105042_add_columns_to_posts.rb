class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :appointed_user_id, :integer
    # デフォルトで値を代入したい時は、以下の様にdefault:値とする
    add_column :posts, :status, :string,null: false,default: 3
    add_column :posts, :priority, :string,null:false
  end
end
