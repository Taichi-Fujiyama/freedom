class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :appointed_user_id,presence: true
  
  belongs_to :user
  # appointed_user_idとappointed_userの関連付け
  belongs_to :appointed_user, class_name: "User"
end
 
