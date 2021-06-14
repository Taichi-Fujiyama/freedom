class Code < ApplicationRecord
  # scope:任意の名前,->(引数（任意の名前)　{ where(カラム名: "カラム内の値).where(cd: value) }
  scope :status, ->(value) { where(cd_type: "status").where(cd: value).first }
end
