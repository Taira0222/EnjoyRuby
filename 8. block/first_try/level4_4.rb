def replace_string(str)
    if block_given?
        yield(str)
    else
        str
    end
end

puts replace_string("Hello, Ruby World!") { |s| s.sub("Ruby", "Block") }
# => Hello, Block World!

puts replace_string("I love programming!") { |s| s.gsub(" ", "_") }
# => I_love_programming!