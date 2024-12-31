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
pipeline.extend(AggregateModule)
pipeline.extend(TransformModule)
pipeline.extend(FilterModule)
# expandは継承チェーンの先頭に入る性質があるので
# [FilterModule,TransformModule,AggregateModule]となる
# superをすることでスーパークラスをオーバーライドできるのでチェーン構造で計算が引き継げるという仕組み

p pipeline.process
# => [50]
```

# 問2
```ruby
# ----------------------------------
# LoggerBase
# ----------------------------------
class LoggerBase
  def log(message, level = :info)
    # 最終的に出力する処理
    puts message
  end
end

# ----------------------------------
# LevelPlugin
# ----------------------------------
module LevelPlugin
  # 今回は例として固定値で threshold = :warn とする
  THRESHOLD = :warn
  LEVEL_ORDER = { debug: 1, info: 2, warn: 3, error: 4, fatal: 5 }

  def log(message, level = :info)
    # フィルタリング条件: threshold未満なら出力しない
    return if LEVEL_ORDER[level] < LEVEL_ORDER[THRESHOLD]

    # フィルタを通過したら次に処理を渡す
    super
  end
end

# ----------------------------------
# TimestampPlugin
# ----------------------------------
module TimestampPlugin
  def log(message, level = :info)
    # 現在時刻を付与してから次に処理を渡す
    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    super("#{timestamp} #{message}", level)
  end
end

# ----------------------------------
# UppercasePlugin
# ----------------------------------
module UppercasePlugin
  def log(message, level = :info)
    # 大文字化してから次に処理を渡す
    super(message.upcase, level)
  end
end

# ----------------------------------
# 利用例
# ----------------------------------
logger = LoggerBase.new

# prependする順序を変えると処理順も変化する
logger.singleton_class.prepend(TimestampPlugin)
logger.singleton_class.prepend(UppercasePlugin)
logger.singleton_class.prepend(LevelPlugin)

# このレベルは :warn 未満なので出力されない
logger.log("this is info", :info)

# こちらは threshold(:warn) 以上なのでフィルタを通過し、すべてのプラグインを通る
logger.log("warning occurred!", :warn)
logger.log("serious error!", :error)

```

## 処理の流れ
1. logger.log("this is info", :info)

  * LevelPlugin が受け取る
    * レベルが :info (数値 2) < :warn (数値 3) なのでフィルタされ、super を呼ばずに終了 → 出力なし。
2. logger.log("warning occurred!", :warn)

  * LevelPlugin
    * レベル :warn (3) >= :warn (3) なのでフィルタを通過
    super("warning occurred!", :warn) を呼ぶ
  * UppercasePlugin
    * メッセージを大文字化 → "WARNING OCCURRED!"
    * super("WARNING OCCURRED!", :warn) を呼ぶ
  * TimestampPlugin
    * "YYYY-MM-DD HH:MM:SS WARNING OCCURRED!" という文字列に加工
    * super("YYYY-MM-DD HH:MM:SS WARNING OCCURRED!", :warn) を呼ぶ
  * LoggerBase
    * 最終的に標準出力へ出力する
3. logger.log("serious error!", :error)

    * :error (4) >= :warn (3) → フィルタ通過
    * UppercasePlugin → "SERIOUS ERROR!"
    * TimestampPlugin → "YYYY-MM-DD HH:MM:SS SERIOUS ERROR!"
    * LoggerBase → 出力

## 出力結果
```ruby
2024-12-26 12:00:00 WARNING OCCURRED!
2024-12-26 12:00:00 SERIOUS ERROR!
```