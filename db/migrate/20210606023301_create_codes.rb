class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.integer :cd, null:false
      t.string :cd_type, null:false
      t.string :name

      t.timestamps
    end
  end
end
