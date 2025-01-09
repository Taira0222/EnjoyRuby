def split_bill(amount, number_of_people)
    begin
        per_person = amount / number_of_people
        per_person
    rescue ZeroDivisionError
        puts "0で割ることはできません"
        return nil
    rescue StandardError => e
        puts "エラーが発生しました #{e.message}"
    end
end


p split_bill(1000, 4)  
p split_bill(1000, 0) 
