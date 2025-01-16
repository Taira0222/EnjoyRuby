values = ["1/2", "1.5", "0.2", "2/3"]

total_float = 0
numerator = 0
denominator = 0
total_rational = 0

values.each do |number|    
    if number =~ /\//
        split_number = number.split('/')
        numerator = split_number[0].to_i
        denominator = split_number[1].to_i
        total_rational += Rational(numerator,denominator)
    else
        number = Float(number)
        total_float += number
    end
end


puts "Float の合計: #{total_float}"
puts "Rational の合計: #{total_rational}"

# 出力例（形式のみ）
# Float の合計: (計算結果, 例: 2.4 など)
# Rational の合計: (計算結果, 例: 12/5 など)

# 改良型

values = ["1/2", "1.5", "0.2", "2/3"]
total_float = 0
total_rational = Rational(0)

values.each do |number|  
    if number.include?('/')     
        total_rational += Rational(number)
    else
        total_float += number.to_f
    end
end

puts "Float の合計: #{total_float}"
puts "Rational の合計: #{total_rational}"