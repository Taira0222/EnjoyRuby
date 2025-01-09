class InvalidParamError < StandardError;end



def calculate_square(value)
    unless value.is_a?(Numeric) 
        raise InvalidParamError, "数値ではありません: #{value.inspect}"
    end
    value ** 2   
end

result1 = calculate_square(25)
p result1

begin
    result2 = calculate_square('aikawa')
    puts result2
rescue InvalidParamError => e
    puts "パラメータエラーが発生: #{e.message}"
end

