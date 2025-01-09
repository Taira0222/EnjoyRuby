def even_or_odd(n)
    answer = n.even? ? "even" : "odd"
end

puts even_or_odd(2)   #=> "even"
puts even_or_odd(15)  #=> "odd"
puts even_or_odd(-6)  #=> "even"