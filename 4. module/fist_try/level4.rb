module Animals
    module Mammals 
        class Dog
            def speak
                puts "わんわん"
            end
        end
    end
end

dog = Animals::Mammals::Dog.new
dog.speak

module Vehicles
    module Land
        class Car
            def drive
                puts "運転します"
            end
        end
    end
  end
  
  car = Vehicles::Land::Car.new
  car.drive  # 出力: 運転しています
  