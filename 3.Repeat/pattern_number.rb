
def generate_pattern(n)
    ary = []
    n.times do |number|
        (number + 1 ).times do |i|
            ary << i + 1
        end
        puts ary.join(" ")
        ary = []
    end
end


generate_pattern(5)
generate_pattern(3)