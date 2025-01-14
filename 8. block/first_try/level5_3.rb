# 解けなかった
def each_sorted(hash, by: :key)
    return hash unless block_given?
    if by == :key
        sorted_pairs = hash.sort_by{|k,_v|k}
    elsif by == :value
        sorted_pairs = hash.sort_by{|_k,v|v}
    else
        sorted_pairs = hash.sort_by{|k,_v|k}
    end

    sorted_pairs.each do |k,v|
        yield(k,v)
    end
end

sample_hash = { b: 1, a: 5, c: 3 }

# キー順でソート
each_sorted(sample_hash, by: :key) do |k, v|
puts "#{k} => #{v}"
end
# 実行結果:
# a => 5
# b => 1
# c => 3

# バリュー順でソート
each_sorted(sample_hash, by: :value) do |k, v|
puts "#{k} => #{v}"
end
# 実行結果:
# b => 1
# c => 3
# a => 5