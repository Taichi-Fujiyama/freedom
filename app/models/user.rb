class User < ApplicationRecord
  validates:name, presence: true,length:{maximum:20}
  validates:email,presence: true,uniqueness: true,format:{with:/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  
end
