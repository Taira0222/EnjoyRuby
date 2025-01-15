def measure_time
    start_time = Time.now
    yield
    finish_time = Time.now

    finish_time - start_time
end

time = measure_time do
    # 何らかの時間のかかる処理
    100_000.times do
        a = 10 * 20
    end
end

puts "処理時間: #{time}秒"