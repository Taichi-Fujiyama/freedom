class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :work_hour
      t.datetime :due_date
      
      t.timestamps
    end 
    
    
  end
  
  
end
