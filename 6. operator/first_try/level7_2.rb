class Person
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def <=>(other)
        self.name.size <=> other.name.size
    end
end


people = [
  Person.new("Eve"),
  Person.new("Bob"),
  Person.new("Alexander"),
  Person.new("Dave")
]

sorted_people = people.sort
p sorted_people.map(&:name)