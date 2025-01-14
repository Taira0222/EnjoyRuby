module FilterModule
    def process
        @arr.select!{|i|i >= 10}
        super
    end

end

module TransformModule
    def process
        @arr.map!{|i|i + 5}
        super
    end
end

module AggregateModule
    def process
        arr_sum = @arr.sum
        arr_calc = arr_sum.fdiv(@arr.size).round(half: :down)
        @arr = arr_calc
        super
    end
end

class DataPipeline
    def initialize(arr)
        @arr = arr
    end
    def process
        @arr
    end
end

# パイプラインにモジュールをミックスインする
pipeline = DataPipeline.new([3,12,49,10,55,7,100])
# 順番にexpandすることで処理順を決定
pipeline.extend(AggregateModule)
pipeline.extend(TransformModule)
pipeline.extend(FilterModule)
p pipeline.process
# => [50]
p pipeline.singleton_class.ancestors