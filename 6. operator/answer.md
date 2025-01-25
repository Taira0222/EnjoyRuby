# レベル 4
## 問題内容（再掲）
配列 numbers の各要素を 3 倍にした新しい配列を作成する。

解答例
```ruby
numbers = [2, 5, 10]

# map メソッドを使って各要素を 3 倍にする
tripled_numbers = numbers.map { |num| num * 3 }

puts tripled_numbers.inspect  #=> [6, 15, 30]
```
map は、ブロック内で処理した結果を新しい配列として返します。
ここでは、各要素 num を num * 3 で処理し、その結果を配列として返しています。

# レベル 5
## 問題内容（再掲）
2 つの整数を受け取り、2 つの整数の差の絶対値を計算して返すメソッド abs_diff を定義する。
Ruby の組み込みメソッド (#abs など) を使わずに、演算子を用いて絶対値を求める。

解答例
```ruby
def abs_diff(a, b)
  difference = a - b
  difference < 0 ? -difference : difference
end

puts abs_diff(10, 4)   #=> 6
puts abs_diff(4, 10)   #=> 6
puts abs_diff(-3, 1)   #=> 4
```
difference = a - b で差を求めます。
差が負の場合は -difference、そうでなければ difference を返します。
# レベル 6
## 問題内容（再掲）
数値を受け取り、その数値が偶数か奇数かを判定して文字列を返すメソッド even_or_odd を作成する。
ここでは、三項演算子を必ず使用する。

解答例
```ruby
def even_or_odd(number)
  number % 2 == 0 ? "even" : "odd"
end

puts even_or_odd(2)    #=> "even"
puts even_or_odd(15)   #=> "odd"
puts even_or_odd(-6)   #=> "even"
```

三項演算子 ?: を用いて、条件 number % 2 == 0 が true の場合は "even"、それ以外の場合は "odd" を返しています。
# レベル 7
## 問題内容（再掲）
Person クラスに <=>（スペースシップ演算子） を定義して、名前の長さを元に大小を比較できるようにする。
複数の Person オブジェクトを配列に格納し、sort メソッドを呼び出したときに、名前の長さが短い順・長い順に並び替えられることを確認する。

解答例
```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  # 名前の長さで比較する <=> の定義
  def <=>(other)
    self.name.length <=> other.name.length
  end
end

people = [
  Person.new("Eve"),
  Person.new("Bob"),
  Person.new("Alexander"),
  Person.new("Dave")
]

sorted_people = people.sort
# Person オブジェクトを name の配列で確認
p sorted_people.map(&:name)
#=> ["Bob", "Eve", "Dave", "Alexander"]
#   (名前の長さ順: 3, 3, 4, 9)
```
<=> 演算子の戻り値が -1, 0, 1 を返すようにする必要があります。
ここでは、name.length をそれぞれ比較し、その結果を <=> で返すことで、Ruby が自動的に並び替えをしてくれます。