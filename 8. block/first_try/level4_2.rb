def select_array(array)
    return array unless block_given? # 配列でなかったらそのまま返す
    
    select_array = array.select {|element| yield(element) } 
end

p select_array([1, 2, 3, 4, 5]) { |num| num.odd? }
# => [1, 3, 5]

p select_array(["Ruby", "Block", "Rails"]) { |str| str.length > 4 }
# => ["Block", "Rails"]