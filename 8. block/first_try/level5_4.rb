def each_consecutive_group(array, n = 3)
    return unless block_given?
    return if array.size < 0

    (0..(array.size)).each do |i|
        result = array[i,n]
        if result.size == n
            yield(result)
        end
    end
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