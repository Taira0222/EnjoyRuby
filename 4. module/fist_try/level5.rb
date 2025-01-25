module SingletonLogger
    def log
        puts "アプリケーションが開始されました"
    end
end

module EnumerableExtensions
    def second
        self[1]
    end
end

class Array
    include EnumerableExtensions
end

arr = [10, 20, 30, 40]
puts arr.second  # 出力: 20
