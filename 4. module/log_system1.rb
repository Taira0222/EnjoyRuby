class LoggerBase
    def initialize
        @name = nil
        @symbol = nil
    end


    def singleton_class
        @name
        @symbol
    end



    def log(name,symbol)
        @name = name
        @symbol = symbol
    end

end

module TimestampPlugin
    def singleton_class
        @
    end

end

module LevelPlugin
    def singleton_class

    end
end

module UppercasePlugin
    def singleton_class

    end
end



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

# 出力結果
2024-12-26 12:00:00 WARNING OCCURRED!
2024-12-26 12:00:00 SERIOUS ERROR!