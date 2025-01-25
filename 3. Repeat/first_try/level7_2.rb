def process_until_fix(data)
    data.map do |item|
        # 整数の処理
        if item.class == "integer"
            if item < 10
                item += 10
                process_until_fix(item)
            elsif item >=10 && item < 50
                item = item_to.s + "ok"
                process_until_fix(item)
            elsif item >= 50
                item = "fix"
            end
        end # ここで一時終了しておかないと再帰呼び出しが下の文字列の式に反映されない

        if item.class == "string"
            if item == "fix"
                return item
            elsif item.slice(-2,2) == "ok"
                item = item.slice!(0,2).to_i + 5
                process_until_fix(item)
            else
                unless item.slice(-5,5) == "?????"
                    if item.size >= 10
                        item = item.slice!(0,(item.size - 3))
                        process_until_fix(item)
                    else
                        item = item.to_s + "?"
                        process_until_fix(item)
                    end
                else
                    item = "fix"
                    return item
                end
            end
        end
    end     
end


data = [3, 12, 49, "hello", 55, "99ok"]
# 処理の流れを簡略: 
#  - 3は10未満→3+10=13 →文字列化"13ok"に次のループで
#  - "hello"は5文字未満→"hello?"追加...など状態が複雑に変化
result = process_until_fix(data)
p result
# 最終的には全て"fix"になって終了

