module Flyable 
    def fly
        puts "飛んでいます"
    end
end

class Bird
    include Flyable
end

bird = Bird.new
bird.fly

module Swimmable
    def swim
        puts "泳ぎます"
    end
  end
  
  class Fish
    include Swimmable
  end
  
  nemo = Fish.new
  nemo.swim  # 出力: （適切なメッセージ）
  