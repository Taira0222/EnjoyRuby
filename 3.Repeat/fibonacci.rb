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

    generate_pattern(10)

    def generate_pattern(n)
        f_b = 0
        f = 1
    
        # 最初の2つの数値を順番に出力
        puts f_b if n >= 1
        puts f if n >= 2
    
        # n > 2 の場合、フィボナッチ数を計算して出力
        (3..n).each do |i|
            f_a = f + f_b
            puts f_a
            f_b = f
            f = f_a
        end
    end
    
    generate_pattern(2)
    