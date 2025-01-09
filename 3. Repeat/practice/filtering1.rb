def process_numbers(number_array)  
    # 第1段落の繰り返し処理
    first_process = number_array.select{|number| number >= 10}

    # 第2段落の繰り返し処理
    second_process = first_process.map{|number| number+= 5}.select{|number| number>= 50}

    # 第3段落の繰り返し処理
    second_average = second_process.sum.fdiv(second_process.size).round(half: :down)
    final_process = second_process.select{|number| number >= second_average}
    
    final_process.sort.each {|i| puts i}

end
process_numbers([3, 12, 49, 10, 55, 7, 100])  