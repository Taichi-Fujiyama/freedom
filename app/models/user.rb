class User < ApplicationRecord
  validates:name, presence: true,length:{maximum:20}
  validates:email,presence: true,uniqueness: true,format:{with:/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :password, presence: true, length: { minimum: 8, maximum: 32}, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,32}\z/}, on: :create
  
  has_secure_password(validations: false)
  has_many :posts
  
  def post_comlete
    # self = methodをよびだしたときに「左側」にあるやつ.ここではposts#updateのuserのこと
    self.experience += 1
    if self.experience == self.user_level
      self.user_level += 1
      self.experience = 0
    end

    self.save
  end
  
  def post_change
    self.experience -= 1
    self.save
  end
    
end

