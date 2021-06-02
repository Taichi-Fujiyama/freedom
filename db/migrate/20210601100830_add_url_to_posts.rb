class AddUrlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :URL, :string
  end
end
