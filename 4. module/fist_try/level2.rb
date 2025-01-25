module Constants
    PI = 3.14159
end

puts Constants::PI

module Utilities
    def self.greet
        puts "hello"
    end
end
  
Utilities.greet  # 出力: こんにちは！
  