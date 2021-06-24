class Code < ApplicationRecord
  # scope:任意の名前,->(引数（任意の名前)　{ where(カラム名: "カラム内の値).where(cd: value) }
  # has_many :posts
  scope :status, ->(value) { where(cd_type: "status").where(cd: value).first }
  
  #updeteで進捗の変更に使うためのもの
  scope :status_select,-> {where(cd_type:"status")}
  scope :priority_select, -> {where(cd_type:"priority")}
  # gem 'hirb'  gem 'hirb-unicode'の２つをインストールすることで、:status_selectをCode.status_selectとしてデータを取得できる。  
end
