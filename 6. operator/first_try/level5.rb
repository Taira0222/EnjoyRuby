def abs_diff(a,b)
    answer = (a-b) >= 0? a-b : -(a-b)
end

puts abs_diff(10, 4)  #=> 6
puts abs_diff(4, 10)  #=> 6
puts abs_diff(-3, 1)  #=> 4