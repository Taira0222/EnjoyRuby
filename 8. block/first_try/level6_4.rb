# とけなかった
def apply_blocks_in_sequence(array, *blocks)
    return array if blocks.empty?

    array.map do |element|
        result = element
        blocks.each do |blk|
            result = blk.call(result)
        end
        result
    end
end

result = apply_blocks_in_sequence([1, 2, 3],
    ->(x) { x * 2 },       # 先に x を2倍
    ->(x) { x.to_s + "!" } # 次に文字列にして末尾に "!"

    )
p result
# => ["2!", "4!", "6!"]