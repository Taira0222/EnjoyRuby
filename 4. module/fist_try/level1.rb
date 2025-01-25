module Greetings
    def self.hello # moduleのメソッドを呼び出すときは必要
        puts "Hello World!"
    end
end

Greetings.hello

module MathOperations
    def add(a, b)
      a + b
    end
  end
  
  class Calculator
    include MathOperations
  end
  
  calc = Calculator.new
  puts calc.add(5, 3)  # 出力: 8
  