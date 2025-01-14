def each_consecutive_pair(array)
    return if array.size < 2

    (0...(array.size - 1)).each do |i|
        yield(array[i],array[i + 1])
    end

end

each_consecutive_pair([10, 20, 30, 40]) do |a, b|
    puts "#{a}と#{b}のペア"
end
# 実行結果:
# 10と20のペア
# 20と30のペア
# 30と40のペア