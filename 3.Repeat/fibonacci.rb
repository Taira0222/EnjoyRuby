    def generate_pattern(n)
        f_b = 0
        f = 1
        f_a = 0
        (1..n).each do |i|
            case  i
            when 1
                puts f_b
            when 2
                puts f
            else
                f_a = f + f_b
                puts f_a
                f_b = f
                f = f_a
            end
        end
    end
