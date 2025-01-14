# できなかった
def reduce_like(array, initial)
    return unless block_given?

    memo = initial
    array.each do |elem|
        memo = yield(memo,elem)
    end
    memo
end

sum = reduce_like([1, 2, 3, 4], 0) do |memo, elem|
    memo + elem
end
p sum
# => 10

max_value = reduce_like([10, 7, 30, 5], -Float::INFINITY) do |memo, elem|
    memo > elem ? memo : elem
end
p max_value
# => 30