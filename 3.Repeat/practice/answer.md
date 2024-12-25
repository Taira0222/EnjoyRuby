# 問1 解答例
```ruby
def process_numbers(nums)
  # 第1段階: 10以上のみ
  nums = nums.select { |x| x >= 10 }

  # 第2段階: 全てに+5し、50以上のみ残す
  nums = nums.map { |x| x + 5 }.select { |x| x >= 50 }

  # 第3段階: 平均値以上のみ残す
  unless nums.empty?
    avg = (nums.sum / nums.size) # 小数点切り捨てを自然に行う整数除算
    nums = nums.select { |x| x >= avg }
  end

  # 昇順にソートして出力
  nums.sort.each { |x| puts x }
end

# 実行例
process_numbers([3, 12, 49, 10, 55, 7, 100])  
# 第1段階後: [12, 49, 10, 55, 100] (10以上)
# 第2段階後: [17, 54, 15, 60, 105] → 50以上: [54, 60, 105]
# 第3段階後: 平均は(54+60+105)=219/3=73, 73以上は[105]
# 出力: 105
```

# 問2 
```ruby
def all_fix?(arr)
  arr.all? { |elem| elem == "fix" }
end

def process_element(elem)
  if elem.is_a?(Integer)
    # 整数の場合の分岐
    if elem < 10
      elem + 10
    elsif elem < 50
      elem.to_s + "ok"  # 文字列にして末尾に "ok"
    else
      "fix"
    end
  else
    # 文字列の場合の分岐
    return "fix" if elem == "fix"  # 既に "fix" の場合は変化なし
    
    # 末尾が "ok" なら -> 整数化 +5
    if elem.end_with?("ok")
      number_str = elem.sub(/ok$/, "") # 末尾 "ok" を除去
      number = number_str.to_i
      number + 5  # 整数を返す
    else
      # 上記いずれでもない文字列
      # まず連続した `?` の数をチェック
      if elem.match(/\?{5,}$/)
        # 末尾に5個以上 `?` がある -> "fix"
        "fix"
      else
        # 長さが10文字以上 -> 末尾3文字を除去
        if elem.size >= 10
          elem[0...(elem.size-3)]
        else
          # 10文字未満 -> 末尾に "?"
          elem + "?"
        end
      end
    end
  end
end

def process_until_fix(arr)
  # 全要素が "fix" になるまで繰り返す
  until all_fix?(arr)
    arr.map!.with_index do |elem, _i|
      # "fix"でない要素に対してのみ process_element を適用
      elem == "fix" ? "fix" : process_element(elem)
    end
  end
  arr
end

# === 実行例 ===
data = [3, 12, 49, "hello", 55, "99ok", 40, "hello????"]
# 処理の流れ:
#  - 3 は10未満 -> 3+10=13 -> "13ok" ...
#  - "hello" は末尾が "ok" でもなく "fix" でもなく10文字未満 -> "hello?" → 次ループ "hello??" ... 5回目で "hello?????" => => "fix"
#  - "hello????" は連続 "?" が4つなのでまだ付与される -> "hello?????" で5つ -> "fix"
#  - "99ok" -> -> 整数99+5=104 -> "fix" (50以上)
#  - 40 -> 10以上50未満 -> "40ok" -> 次ループで45 -> 10以上50未満 → "45ok" ...などルール次第
result = process_until_fix(data)
p result
# => 全て "fix" となった配列例: ["fix","fix","fix","fix","fix","fix","fix","fix"]

```