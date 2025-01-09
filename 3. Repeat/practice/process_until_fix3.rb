# 処理を3つに分ける
# 1 すべてfixか確認する
# 2 process_elementで整数と文字列の処理を行う
# 3 1,2の処理を process_until_fixで行う(再帰呼び出しするため)

def arr_fix?(arr)
    arr.all?{|x| x == "fix"}
end

def process_element(elem)
    # 整数の処理
    if elem.is_a?(Integer) # クラスの判定。rubyらしいダックタイピングの観念のもと elem.class ではなくelem.is_a?にしている
        if elem < 10
            elem + 10 #=> elem += 10でもよさそう？
        elsif elem >= 10 && elem < 50
            elem.to_s + "ok"
        else
            "fix"
        end
    # 文字列の処理
    elsif elem.is_a?(String) #fixの処理
        if elem == "fix"
            "fix"
        elsif elem.end_with?("ok") # okで終わる処理　解けなかった
            num_str = elem.gsub(/ok$/,"")
            num = num_str.to_i
            num + 5
        else
            if elem[-5..-1] == "?????"
                "fix"
            elsif elem.size >= 10
                elem[0...(elem.size - 3)] # elem[n] でn文字表示、 ...で0以上elem-3未満
            elsif elem.size < 10
                elem + "?"
            end
        end
    end
end


def process_until_fix(arr)
    until arr_fix?(arr)
        arr.map! do |elem|
            unless elem.is_a?(Integer) || elem.is_a?(String)
                "fix"
            else
                elem == "fix"? "fix" : process_element(elem)
            end
        end
    end
    arr # つけ忘れ
end

data = [3, 12, 49, "hello", 55, "99ok",[1,2,3]]
# 処理の流れを簡略: 
#  - 3は10未満→3+10=13 →文字列化"13ok"に次のループで
#  - "hello"は5文字未満→"hello?"追加...など状態が複雑に変化
result = process_until_fix(data)
p result
# 最終的には全て"fix"になって終了