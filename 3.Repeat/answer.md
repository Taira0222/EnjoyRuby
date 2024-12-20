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
  arr.all? { |x| x == "fix" }
end

def process_element(elem)
  if elem.is_a?(Integer)
    if elem < 10
      elem + 10
    elsif elem < 50
      (elem.to_s + "ok")
    else
      "fix"
    end
  else
    # elemは文字列の場合
    if elem == "fix"
      "fix"
    elsif elem.end_with?("ok")
      # "15ok"→"15"
      num_str = elem.sub(/ok$/, '')
      num = num_str.to_i
      num + 5
    else
      # 文字列だが"ok"で終わらず、"fix"でもない
      if elem.length >= 10
        # 最後の3文字除去
        elem[0...(elem.size-3)]
      else
        # 短いなら末尾に"?"
        elem + "?"
      end
    end
  end
end

def process_until_fix(arr)
  until all_fix?(arr)
    arr.map! { |e| process_element(e) }
  end
  arr
end

# 実行例
data = [3, 12, 49, "hello", 55, "99ok"]
# 処理の流れを簡略: 
#  - 3は10未満→3+10=13 →文字列化"13ok"に次のループで
#  - "hello"は5文字未満→"hello?"追加...など状態が複雑に変化
result = process_until_fix(data)
p result
# 最終的には全て"fix"になって終了
```