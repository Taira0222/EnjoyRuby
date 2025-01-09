class Person
    @@people = []

    attr_reader :name

    def initialize(name)
        @@people << name
    end

    def self.sort
        @@people.sort_by{|i|[i.size, i]}
    end


end

person1 = Person.new("Eve"),
person2 = Person.new("Bob"),
person3 = Person.new("Alexander"),
person4 = Person.new("Dave")

p Person.sort