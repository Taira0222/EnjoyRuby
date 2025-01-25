# 問題1(レベル4)
```ruby
def transform_array(array)
    return array unless block_given?

    result =[]
    array.each do |element|
        result << yield(element)
    end
    result
end
  
p transform_array([1, 2, 3]) { |num| num * 2 }
# => [2, 4, 6]

p transform_array(["Ruby", "Block"]) { |str| str.upcase }
# => ["RUBY", "BLOCK"]
```

# 問題2(レベル4)
```ruby
def select_array(array)
  # ブロックが渡されていない場合は、そのまま配列を返すか、空配列を返すか等、仕様次第
  return array unless block_given?

  result = []
  array.each do |element|
    # yieldでブロックを呼び出し、戻り値が真ならresultに追加
    result << element if yield(element)
  end
  result
end

# 動作確認
p select_array([1, 2, 3, 4, 5]) { |num| num.odd? }
# => [1, 3, 5]

p select_array(["Ruby", "Block", "Rails"]) { |str| str.length > 4 }
# => ["Block", "Rails"]
```

# 問題3(レベル4)

```ruby
def show_transformed_value(number)
  if block_given?
    # ブロックがあれば、加工後の値を表示
    puts yield(number)
  else
    # ブロックがなければ、そのままの値を表示
    puts number
  end
end

# 動作確認
show_transformed_value(10) { |num| num * 3 }
# => 30 (表示)

show_transformed_value(7)
# => 7 (表示)
```

# 問題4(レベル4)
```ruby
def replace_string(str)
  # ブロックが渡されない場合は、そのまま文字列を返す
  return str unless block_given?

  # ブロックに文字列を渡し、戻り値を返す
  yield(str)
end

# 動作確認
puts replace_string("Hello, Ruby World!") { |s| s.sub("Ruby", "Block") }
# => Hello, Block World!

puts replace_string("I love programming!") { |s| s.gsub(" ", "_") }
# => I_love_programming!
```

# 問題5(レベル4)
```ruby
def calculate_total(array)
  # 合計値を0で初期化
  total = 0
  # ブロックが渡されなかった場合は、そのまま合計値(0)を返す
  return total unless block_given?

  array.each do |element|
    total += yield(element)
  end
  total
end

# 動作確認
p calculate_total([1, 2, 3, 4]) { |num| num * 2 }
# => 20

p calculate_total([1, -2, 3]) { |num| num ** 2 }
# => 14
```
# 問題6(レベル5)

```ruby
def each_consecutive_pair(array)
  # 配列の要素数が1以下の場合は何もしない例
  return if array.size < 2

  (0...(array.size - 1)).each do |i|
    yield(array[i], array[i + 1])
  end
end

each_consecutive_pair([10, 20, 30, 40]) do |a, b|
  puts "#{a}と#{b}のペア"
end
# 実行結果:
# 10と20のペア
# 20と30のペア
# 30と40のペア
```

# 問題7(レベル5)
```ruby
def each_step(array, step)
  return unless block_given?
  return if step <= 0  # stepが0以下だと無限ループになる恐れがあるので簡単にガード

  i = 0
  while i < array.size
    yield(array[i])
    i += step
  end
end

# 動作確認
each_step([10, 20, 30, 40, 50, 60], 2) do |elem|
  puts elem
end
# 実行結果:
# 10
# 30
# 50
```

# 問題8(レベル5)
```ruby
def each_sorted(hash, by: :key)
  return unless block_given?
  # by: :key or :value でソート方法を切り替え
  sorted_pairs =
    case by
    when :key
      hash.sort_by { |k, _v| k }   # キー順
    when :value
      hash.sort_by { |_k, v| v }  # バリュー順
    else
      hash.sort_by { |k, _v| k }  # デフォルトはキー順
    end

  sorted_pairs.each do |k, v|
    yield(k, v)
  end
end

# 動作確認
sample_hash = { b: 2, a: 1, c: 3 }

# キー順でソート
each_sorted(sample_hash, by: :key) do |k, v|
  puts "#{k} => #{v}"
end
# 実行結果:
# a => 1
# b => 2
# c => 3

# バリュー順でソート
each_sorted(sample_hash, by: :value) do |k, v|
  puts "#{k} => #{v}"
end
# 実行結果:
# a => 1
# b => 2
# c => 3
```

# 問題9(レベル5)
```ruby
def each_consecutive_group(array, n = 3)
  return unless block_given?
  return if n <= 0  # nが0以下の場合は処理できないためガード

  # たとえば「最後のまとまりが n 個に満たない場合はスキップする」仕様とする
  (0..(array.size - n)).each do |i|
    group = array[i, n]  # i番目からn個取り出す
    yield(group)
  end
end

# 動作確認
each_consecutive_group([1, 2, 3, 4, 5], 3) do |group|
  p group
end
# => [1, 2, 3]
# => [2, 3, 4]
# => [3, 4, 5]

each_consecutive_group(["R", "u", "b", "y"], 2) do |group|
  puts group.join
end
# => Ru
# => ub
# => by
```

# 問題10(レベル5)
```ruby
def reduce_like(array, initial)
  return initial unless block_given?

  memo = initial
  array.each do |elem|
    memo = yield(memo, elem)
  end
  memo
end

# 動作確認
sum = reduce_like([1, 2, 3, 4], 0) do |memo, elem|
  memo + elem
end
p sum
# => 10

max_value = reduce_like([10, 7, 30, 5], -Float::INFINITY) do |memo, elem|
  memo > elem ? memo : elem
end
p max_value
# => 30

```

# 問題11(レベル6)
```ruby
def measure_time
  start_time = Time.now
  yield  # ブロックの実行
  end_time = Time.now
  end_time - start_time  # 経過時間を返す
end

time = measure_time do
  # 例: 何らかの時間のかかる処理
  100_000.times do
    a = 10 * 20
  end
end

puts "処理時間: #{time}秒"
```

# 問題12(レベル6)
```ruby
def average_time(times)
  # ブロックが与えられていない、または回数が0以下の場合は0を返す等の制御
  return 0 unless block_given?
  return 0 if times <= 0

  total_time = 0.0
  times.times do
    start = Time.now
    yield  # ブロック実行
    finish = Time.now
    total_time += (finish - start)
  end

  total_time / times
end

# 動作確認
avg = average_time(5) do
  # 例: 1万回程度のループ
  10_000.times { 10 * 20 }
end

puts "平均実行時間: #{avg}秒"
```
# 問題13(レベル6)
```ruby
def read_file_with_progress(filepath)
  return unless block_given?

  # ファイルが存在するかどうか簡易チェック (実際はFile.exist?(filepath)なども可)
  unless File.readable?(filepath)
    puts "ファイルが見つからないか、読み込めません: #{filepath}"
    return
  end

  # 1回目: ファイルの総行数を取得
  total_lines = 0
  File.foreach(filepath) { total_lines += 1 }

  return if total_lines.zero?  # 空ファイルなら処理終了

  # 2回目: 読み込みつつ進捗を計算
  current_line = 0
  File.foreach(filepath) do |line|
    current_line += 1
    progress = ((current_line.to_f / total_lines) * 100).to_i
    # ブロックに渡す: (行の内容, 進捗)
    yield(line.chomp, progress)
  end
end

# 動作確認 (例)
# read_file_with_progress("sample.txt") do |line, progress|
#   puts "[#{progress}%] #{line}"
# end
```