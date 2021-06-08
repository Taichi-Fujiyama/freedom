require "csv"

CSV.foreach("db/csv_for_seed.csv") do |info|
  Code.create(:cd => info[0],:cd_type =>info[1],:name =>info[2])
  # infoのインデックス番号はmysqlのテーブルではなくて、実際のcsvファイルのカラム順にする
end
