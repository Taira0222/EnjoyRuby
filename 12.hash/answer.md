# 問題1(レベル4)
```ruby
# ユーザー管理用のハッシュ
users = {}

# ユーザーを追加
users[1] = "Alice"
users[2] = "Bob"

# ユーザーが存在するか確認
puts users.key?(1) # => true
puts users.has_key?(3) # => false

# ユーザーを削除
users.delete(2)

# 全てのユーザーを表示
users.each do |id, name|
  puts "ID: #{id}, 名前: #{name}"
end
```

# 問題2(レベル5)
```ruby
# 売上データ管理用のハッシュ
sales = {}

# 店舗ごとの売上を追加
sales["店舗A"] = 150000
sales["店舗B"] = 200000
sales["店舗C"] = 120000

# 全店舗の総売上を計算
total_sales = sales.values.inject(0) { |sum, sale| sum + sale }
puts "総売上: #{total_sales}" # => 総売上: 470000

# 特定の店舗の売上を取得
store = "店舗B"
if sales.key?(store)
  puts "#{store}の売上: #{sales[store]}"
else
  puts "#{store}のデータは存在しません。"
end

# 売上が150000を超えた店舗をリストアップ
threshold = 150000
high_sales_stores = sales.select { |store, sale| sale > threshold }.keys
puts "売上が#{threshold}を超えた店舗: #{high_sales_stores.join(', ')}"
# => 売上が150000を超えた店舗: 店舗B

```

