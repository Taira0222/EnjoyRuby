def generate_pattern(n)
    (1..n).each do |i|
        puts ((1..i).map{|j|j}.join(" "))
    end
end

generate_pattern(3)