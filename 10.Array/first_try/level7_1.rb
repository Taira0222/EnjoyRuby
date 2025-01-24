require 'benchmark'

arr = Array.new(1_000_000){ rand(1..100) }

Benchmark.bm do |x|
    x.report("map") { arr.map{|i| i*2}}
    x.report("reject") { arr.reject{|i| i < 50} } 
end


# 変数に保存する

require 'benchmark'

map_result = nil
reject_result = nil

arr = Array.new(1_000_000){ rand(1..100) }

Benchmark.bm do |x|
    x.report("map") { map_result = arr.map{|i| i*2}}
    x.report("reject") { reject_result = arr.reject{|i| i < 50} } 
end



