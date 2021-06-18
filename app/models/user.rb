class User < ApplicationRecord
  validates:name, presence: true,length:{maximum:20}
  validates:email,presence: true,uniqueness: true,format:{with:/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :password, presence: true, length: { minimum: 8, maximum: 32}, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,32}\z/}
  
  has_secure_password
  has_many :posts
  
end

