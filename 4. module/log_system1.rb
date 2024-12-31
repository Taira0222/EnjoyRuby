class LoggerBase
    def log(message, level = :info)
        puts "#{message}!"
    end

end

module TimestampPlugin
    def log(message, level = :info)
        timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
        super("#{timestamp} #{message}",level) # LevelPluginに第一引数#{timestamp} #{message},第二引数 levelを渡す
    end

end

module UppercasePlugin
    def log(message, level = :info)
        super(message.upcase,level)
    end
end

module LevelPlugin
    THEWSHOLD = :warn
    LEVEL_ORDER = { debug: 1, info: 2, warn: 3, error: 4, fatal: 5 }
    def log(message, level = :info)
        return if LEVEL_ORDER[level] < LEVEL_ORDER[THEWSHOLD]
        super
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

