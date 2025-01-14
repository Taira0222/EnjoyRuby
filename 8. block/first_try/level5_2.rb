def each_step(array, step)
    return array unless block_given?

    (0...array.size).step(step) do |i|
        yield(array[i])
    end
end

each_step([10, 20, 30, 40, 50, 60], 2) do |elem|
    puts elem
end
# 実行結果:
# 10
# 30
# 50
