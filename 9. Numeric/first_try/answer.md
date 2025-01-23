# レベル4
```ruby
# レベル4: 配列内の統計値を求める

numbers = [2, 7, 3, 10, 5]

# 合計
sum = numbers.sum
# 平均 (合計 ÷ 要素数)  小数が出るように to_f を使用
average = sum.to_f / numbers.size
# 最大値
max_value = numbers.max
# 最小値
min_value = numbers.min

puts "合計: #{sum}"
puts "平均: #{average}"
puts "最大値: #{max_value}"
puts "最小値: #{min_value}"

```

# レベル5

```ruby
# レベル5: 有理数や小数を混在させた配列の合計を求める

values = ["1/2", "1.5", "0.2", "2/3"]

total_float    = 0.0
total_rational = Rational(0)  # 初期値を Rational(0) にしておく

values.each do |val|
  if val.include?("/")  # "/" を含む → 有理数として処理
    total_rational += Rational(val)
  else                  # 小数点として処理
    total_float += val.to_f
  end
end

puts "Float の合計: #{total_float}"
puts "Rational の合計: #{total_rational}"

```

# レベル6
```ruby
# レベル6: 複素数の四則演算と極形式の表示

z1 = Complex(3, 4)
z2 = Complex(1, -2)

# 各種演算
add_result = z1 + z2
sub_result = z1 - z2
mul_result = z1 * z2
div_result = z1 / z2

puts "足し算: #{add_result}"   # 例) (4+2i)
puts "引き算: #{sub_result}"   # 例) (2+6i)
puts "掛け算: #{mul_result}"   # 例) (11-2i)
puts "割り算: #{div_result}"   # 例) (-1+2i)

# 絶対値 (abs) と 偏角 (arg)
puts "絶対値: #{div_result.abs}"   # 例) 2.23606797749979
puts "偏角: #{div_result.arg}"     # 例) 2.0344439357957027
```

# レベル7
```ruby
require 'bigdecimal'

data = ["100.50", "200.80", "9999.99", "0.01", "3000.00"]
# 実際には数万～数百万件など大量を想定

# BigDecimal(0) を初期値として累積合計
total = data.inject(BigDecimal("0")) do |sum, val|
  sum + BigDecimal(val)
end

puts "合計: #{total.to_s('F')}"

puts "高速化のアイデア:"
puts "- Ractor などを用いた並列化で部分集計を併用する"
puts "- ネイティブ拡張による高速な合算処理"
puts "- GC 発生回数を抑えるための実装・パラメータ調整"
```