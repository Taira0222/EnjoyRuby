# 問題1 配列変換用メソッドの定義(レベル4)
## 問題
配列とブロックを受け取り、配列の各要素にブロックを適用して変換した新しい配列を返すメソッド transform_array を定義してください。下記のサンプル実行時にコメントに示す結果が得られるように実装してください。

```ruby
def transform_array(array)
  # ここにコードを記述
end

p transform_array([1, 2, 3]) { |num| num * 2 }
# => [2, 4, 6]

p transform_array(["Ruby", "Block"]) { |str| str.upcase }
# => ["RUBY", "BLOCK"]
```
## ポイント

メソッド引数でブロックを受け取り、呼び出しの際に yield を使う、または block.call を使う。
ブロックを渡さなかった場合の挙動をどうするか考慮してもよい。


# 問題2 配列から条件に合う要素のみを返すメソッドを定義(レベル4)
## 問題
配列とブロックを受け取り、ブロックの条件を満たす要素のみを新しい配列として返すメソッド select_array を定義してください。

```ruby
def select_array(array)
  # ここにコードを記述
end

p select_array([1, 2, 3, 4, 5]) { |num| num.odd? }
# => [1, 3, 5]

p select_array(["Ruby", "Block", "Rails"]) { |str| str.length > 4 }
# => ["Block", "Rails"]
```
## ポイント

* Array#select を使わずに、ブロックを用いて自作する。
* yield でブロックを呼び出した結果が真の場合のみ配列に追加する。
* ブロックが渡されなかった場合の挙動をどうするかは任意。

# 問題3 メソッドで受け取った値を加工して表示(レベル4)
## 問題
数値とブロックを受け取り、ブロックの処理を経た結果を画面に表示するメソッド show_transformed_value を定義してください。ブロックが与えられなかった場合は、そのままの数値を表示するようにしてください。

```ruby
def show_transformed_value(number)
  # ここにコードを記述
end

show_transformed_value(10) { |num| num * 3 }
# => 30

show_transformed_value(7)
# => 7
```
## ポイント

* block_given? メソッドでブロックが渡されたかを判定できる。
* yield でブロック呼び出しを行うか、そのままの値を使用するか条件分岐する。
* ブロックの戻り値を受け取って出力する実装に注意する。

# 問題4: ブロック内で文字列の置換を行うメソッド(レベル4)
## 問題
文字列とブロックを受け取り、与えられた文字列に対しブロック内で何らかの置換処理を行うメソッド replace_string を定義してください。下記サンプルのように、元の文字列をブロックの戻り値で置き換えた結果を出力してください。


```ruby
def replace_string(str)
  # ここにコードを記述
end

puts replace_string("Hello, Ruby World!") { |s| s.sub("Ruby", "Block") }
# => Hello, Block World!

puts replace_string("I love programming!") { |s| s.gsub(" ", "_") }
# => I_love_programming!
```
## ポイント

* yield でブロックを呼び出すときに、元の文字列 str を渡し、戻り値で置換後の文字列を受け取る。
* sub や gsub などの文字列置換メソッドを使わなくても、ブロック内でどのように変更してもよい。
* ブロックがない場合にどうするか考慮してもよい。

# 問題5: 計算式をブロックで指定する合計値算出メソッド(レベル4)
## 問題
配列とブロックを受け取り、配列の各要素をブロックで指定した計算式に当てはめ、その合計値を返すメソッド calculate_total を定義してください。合計値が0または負の数になる可能性も考慮してください。



```ruby
def calculate_total(array)
  # ここにコードを記述
end

p calculate_total([1, 2, 3, 4]) { |num| num * 2 }
# => (1*2) + (2*2) + (3*2) + (4*2) = 20

p calculate_total([1, -2, 3]) { |num| num ** 2 }
# => (1^2) + ((-2)^2) + (3^2) = 1 + 4 + 9 = 14
```
## ポイント

* inject や reduce を使わずに自力で実装してみてもよい。
* ブロックの有無や要素数が0の場合の挙動も検討する。
* ブロックを使用することで柔軟な計算式を適用できるようにする。

# 問題6: 連続するペアをブロックに渡す(レベル5)
## 問題
配列内の要素を連続するペア（隣り合う2要素）ごとにブロックへ渡すメソッド each_consecutive_pair を定義してください。下記サンプルのように実行し、指定の出力結果が得られるようにしてください。

```ruby
def each_consecutive_pair(array)
  # ここにコードを記述
end

each_consecutive_pair([10, 20, 30, 40]) do |a, b|
  puts "#{a}と#{b}のペア"
end
# 実行結果:
# 10と20のペア
# 20と30のペア
# 30と40のペア
```
## ポイント

* 配列の要素数に応じて連続ペアの数が変わることに注意。
* ブロックを呼び出す際の引数の渡し方を理解する。

# 問題7 指定したステップ間隔で要素をブロックに渡す(レベル5)
## 問題
配列とステップ間隔（正の整数）、ブロックを受け取り、配列の最初の要素から指定したステップ間隔ごとに要素をブロックに渡すメソッド each_step を定義してください。


```ruby
def each_step(array, step)
  # ここにコードを記述
end

each_step([10, 20, 30, 40, 50, 60], 2) do |elem|
  puts elem
end
# 実行結果:
# 10
# 30
# 50
```
## ポイント

* step が1の場合は通常の each と同じ動きになる。
* ステップ間隔が配列の要素数を超える場合は、最初の要素だけがブロックに渡される。
* ブロックが与えられなかった場合の挙動を考慮するとよりよい。

# 問題8: ハッシュをキーまたはバリューでソートしてブロックに渡す(レベル5)
## 問題
ハッシュとソートの対象（キー/バリュー）を受け取り、ソートした順番で key, value のペアをブロックに渡すメソッド each_sorted を定義してください。ソート対象を指定しなかった場合はキーでソートするものとします。

```ruby
def each_sorted(hash, by: :key)
  # ここにコードを記述
end

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
## ポイント

* hash.sort_by などを使って、ソートの対象（キー/バリュー）を柔軟に切り替える。
* ブロックに渡す順番が要求を満たすよう注意。
* デフォルト引数を使う・block_given? の有無を考えるなど、使いやすさを検討する。


# 問題9: 配列から連続する n 個の要素の組をブロックに渡す(レベル5)
## 問題
配列とブロックを受け取り、配列の要素を連続する n 個（デフォルトは3個）のまとまり（スライド）としてブロックに渡すメソッド each_consecutive_group を定義してください。最後のまとまりが n 個に満たない場合は、スキップするかブロックに渡すかは仕様を決めてください。

```ruby
def each_consecutive_group(array, n = 3)
  # ここにコードを記述
end

each_consecutive_group([1, 2, 3, 4, 5], 3) do |group|
  p group
end
# 期待される出力例:
# [1, 2, 3]
# [2, 3, 4]
# [3, 4, 5]

each_consecutive_group(["R", "u", "b", "y"], 2) do |group|
  puts group.join
end
# 期待される出力例:
# Ru
# ub
# by
```
## ポイント

* each_cons (Enumerable) に似た処理を自作で実装するイメージ。
* n の値と配列のサイズによってブロックへの呼び出し回数が変わる。
* 最後のまとまりが n 個に満たない場合の扱いをどうするかを仕様として決定する。

# 問題10: 前回の処理結果を次回に引き継ぎながら配列を処理する(レベル5)
## 問題
配列を受け取り、配列の各要素を順番にブロックに渡していきます。ただし、ブロックは「前回の処理結果（初回は初期値）と現在の要素」を引数として受け取り、戻り値を次の要素の処理に引き継ぎます。最後に得られた結果を返すメソッド reduce_like を定義してください。
（Rubyには Array#reduce や Array#inject が存在しますが、これらを使わずに自分で実装してください）



```ruby
def reduce_like(array, initial)
  # ここにコードを記述
end

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
## ポイント

* Rubyの inject / reduce に類似する動きを自前で実装する。
* ブロックの第1引数が前回処理の結果、第2引数が現在の要素。
* 前回処理の結果を次の繰り返しに持ち回るロジックがポイント。
* 配列が空の場合の扱いについても考慮するとよりよい。