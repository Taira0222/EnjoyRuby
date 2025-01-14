def calculate_total(array)
    return array unless block_given?

    total = 0
    array.each do |element|
        total += yield(element)
    end
    total
end

p calculate_total([1, 2, 3, 4]) { |num| num * 2 }
# => (1*2) + (2*2) + (3*2) + (4*2) = 20

p calculate_total([1, -2, 3]) { |num| num ** 2 }
# => (1^2) + ((-2)^2) + (3^2) = 1 + 4 + 9 = 14