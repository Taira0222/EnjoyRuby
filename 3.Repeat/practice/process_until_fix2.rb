def arr_fix?(arr)
    arr.all?{|x| x == "fix"}
  end
  
  def process_element(elem)
    # 整数の処理
    if elem.is_a?(Integer)
      if elem < 10
        elem + 10
      elsif elem >= 10 && elem < 50
        elem.to_s + "ok"
      else
        "fix"
      end
    end
  
    # 文字列の処理
    if elem.is_a?(String)
      if elem == "fix"
        "fix"
      elsif elem.end_with?("ok")
        num_str = elem.gsub(/ok$/,"")
        num = num_str.to_i
        num + 5
      else
        if elem[-5..-1] == "?????"
          "fix"
        elsif elem.size >= 10
          elem[0...(elem.size - 3)]
        elsif elem.size < 10
          elem + "?"
        end
      end
    end
  end
  
  def process_until_fix(arr)
    until arr_fix?(arr)
      arr.map! do |elem|
        elem == "fix"? "fix" : process_element(elem)
      end
    end
  end
  
  data = [3, 12, 49, "hello", 55, "99ok"]
  result = process_until_fix(data)
  p result
  