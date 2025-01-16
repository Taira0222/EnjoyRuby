def average_time(times)
    return 0 unless block_given?
    return 0 if times <= 0
    
    total_time = 0
    times.times do |i|
        start_time = Time.now
        yield
        finish_time = Time.now
        total_time += finish_time - start_time
    end
    total_time.fdiv(times)
end

avg = average_time(5) do
# 処理例: 1万回程度のループ
10_000.times { 10 * 20 }
end

puts "平均実行時間: #{avg}秒"