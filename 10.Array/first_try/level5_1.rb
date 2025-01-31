require 'csv'
users =[]

# ここはわからなかったので解答を確認した
CSV.foreach("users.csv", headers: true) do |row|
    # rowはCSV::Rowオブジェクト
    # row["name"], row["age"] などで取得可能
    users << {
      name: row["name"],
      age:  row["age"].to_i
    }
end

puts users.sort_by{|u|u[:age]}
