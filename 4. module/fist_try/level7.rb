module FilterModule
    def process
        @arr.select!{|x| x >= 10}
    end
end

module TransformModule
    def process
        @arr.map!{|x| x + 5}
    end
end

module AggregateModule
    def process
        @arr.sum.fdiv(@arr.size).round(half: :down)
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

# 順番にincludeすることで処理順を決定
pipeline.extend(AggregateModule)
pipeline.extend(TransformModule)
pipeline.extend(FilterModule)


p pipeline.process
# => [50]