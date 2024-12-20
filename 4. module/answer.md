# 問1 
```ruby
module FilterModule
  def process
    @data.select! { |x| x >= 10 }
    super
  end
end

module TransformModule
  def process
    @data.map! { |x| x + 5 }
    super
  end
end

module AggregateModule
  def process
    unless @data.empty?
      avg = @data.sum / @data.size
      @data = [avg]
    end
    super
  end
end

class DataPipeline
  def initialize(data)
    @data = data
  end

  # 最終的にsuperが呼ばれ続け、最後はこのprocessが呼ばれる
  def process
    @data
  end
end

# パイプラインにモジュールをミックスインする
pipeline = DataPipeline.new([3,12,49,10,55,7,100])
# 順番にincludeすることで処理順を決定
pipeline.extend(FilterModule)
pipeline.extend(TransformModule)
pipeline.extend(AggregateModule)

p pipeline.process
# => [50]
```

# 問2
```ruby
module TimestampPlugin
  def log(message, level=:info)
    message = "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} #{message}"
    super(message, level)
  end
end

module LevelPlugin
  # WARN以上のみ通す
  LEVEL_ORDER = {debug:0, info:1, warn:2, error:3}
  def log(message, level=:info)
    if LEVEL_ORDER[level] >= LEVEL_ORDER[:warn]
      super(message, level)
    else
      # debugやinfoは出力しない
    end
  end
end

module UppercasePlugin
  def log(message, level=:info)
    message = message.upcase
    super(message, level)
  end
end

class LoggerBase
  def log(message, level=:info)
    puts message
  end
end

# プラグインを好みの順序でprependする
logger = LoggerBase.new
logger.singleton_class.prepend(TimestampPlugin)
logger.singleton_class.prepend(UppercasePlugin)
logger.singleton_class.prepend(LevelPlugin)

logger.log("this is info", :info)   # infoは出力されない（levelpluginでフィルタ）
logger.log("warning occurred!", :warn)
# => "2023-08-20 12:00:00 WARNING OCCURRED!"
```