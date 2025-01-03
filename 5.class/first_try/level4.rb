class Circle
    def initialize(radius)
        @radius = radius
    end

    def diameter
        diameter = @radius * 2
    end

    def area
        area = Math::PI * @radius ** 2
    end

    def circumference
        circumference =2 * Math::PI * @radius
    end

end

circle = Circle.new(5)
p circle.diameter       
p circle.area           
p circle.circumference