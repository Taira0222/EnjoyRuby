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