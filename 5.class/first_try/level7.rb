class DynamicProperties
    attr_accessor :properties
    def initialize
        @properties = {}
    end


    def method_missing(method,*args)
    end

    def respond_to_missing?(method,include_private = false)
    end




end

dp = DynamicProperties.new
dp.name = "Ruby"
p dp