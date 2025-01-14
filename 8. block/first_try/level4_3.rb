def show_transformed_value(number)
    if block_given?
        puts yield(number)
    else
        puts number
    end
end


show_transformed_value(10) { |num| num * 3 }
# => 30

show_transformed_value(7)
# => 7