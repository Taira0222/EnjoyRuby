# 問題1(レベル4)
```ruby
# access.log の各行に「IPアドレス パス」が空白区切りで書かれていると想定
# 例）
# 127.0.0.1   /users
# 192.168.0.10    /products
# 192.168.0.11    /orders

def parse_access_log(file_path)
  results = []

  File.foreach(file_path) do |line|
    # まず前後の余分な空白や改行を取り除く
    line = line.strip
    # 空行はスキップ
    next if line.empty?

    # 空白区切りで分割
    columns = line.split(/\s+/)
    results << columns
  end

  results
end

# 実行例（ファイルパスは環境に合わせて変更）
p parse_access_log("access.log")
# => [
#   ["127.0.0.1", "/users"],
#   ["192.168.0.10", "/products"],
#   ["192.168.0.11", "/orders"]
# ]
```
# 問題2(レベル5)
```ruby
# 複数のキーワードを配列で受け取り、先頭だけ大文字・それ以降を小文字に整形して返す

def normalize_keywords(keywords)
  keywords.map(&:capitalize)
end

keywords = ["rAils", "ruBY", "SInatRa"]
normalized = normalize_keywords(keywords)
puts normalized.inspect
# => ["Rails", "Ruby", "Sinatra"]
```
# 問題3(レベル5)
```ruby
# 仕様:
# - "ID-" で始まる
# - その後ろに英数字のみ、最大10文字
# - それ以外は nil を返す

def extract_user_id(str)
  prefix = "ID-"
  return nil unless str.start_with?(prefix)

  user_id_part = str.slice(prefix.size, str.size - prefix.size)
  # 英数字のみかどうか (空文字も可とするなら \A\w*\z でも)
  return nil unless user_id_part =~ /\A[a-zA-Z0-9]+\z/
  # 10文字以内かどうか
  return nil if user_id_part.size > 10

  user_id_part
end

puts extract_user_id("ID-abc123")          # => "abc123"
puts extract_user_id("ID-somethinglongerthanten")  # => nil
puts extract_user_id("ABC-xyz99")         # => nil
```
# 問題4(レベル5)
```ruby
# 以下の要件:
# - "<" と ">" を削除
# - 全角スペースは半角スペースに置換

def sanitize_comment(input)
  # "<" と ">" を削除
  result = input.delete("<>")
  # 全角スペース -> 半角スペース
  result.tr("　", " ")
end

comment = "ここは <危険> な場所　です。"
puts sanitize_comment(comment)
# => "ここは 危険 な場所 です。"
```
# 問題5(レベル6)
```ruby
items = [
  ["Apple", 120],
  ["Orange", 50],
  ["Juice", 1500.75]
]

def format_price(price)
  # 小数点以下を2桁まで表示
  formatted = sprintf("%.2f", price)  # => "120.00" など
  # 3桁区切り(小数点前にカンマ)を入れる正規表現
  # (\d)(?=(\d{3})+\.) は「後ろに3桁の並びが続き、そのあとに '.' が来る箇所」の前をキャプチャするパターン
  formatted.gsub(/(\d)(?=(\d{3})+\.)/, "\\1,")
end

items.each do |(name, price)|
  # priceが小数点以下を持たない場合は 120.00 -> "120.00" -> "120" にしたい場合など
  # そこは要件次第で処理を追加
  puts "#{name}: ￥#{format_price(price)}"
end

# 実行結果 (期待):
# Apple: ￥120.00
# Orange: ￥50.00
# Juice: ￥1,500.75
```