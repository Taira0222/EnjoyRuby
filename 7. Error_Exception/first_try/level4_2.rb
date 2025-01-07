def to_int_safely(str)
    begin
        Integer(str)
    rescue ArgumentError,TypeError
        return nil
    end
end

p to_int_safely("taira")
p to_int_safely([1,2,3])