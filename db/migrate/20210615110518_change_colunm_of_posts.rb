class ChangeColunmOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts,:title,:string,null:false
    change_column :posts,:description,:text,null:false
  end
end
