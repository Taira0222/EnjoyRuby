require 'json'

class JsonDataError < StandardError; end

def parse_json_data(json_str)
    return ArgumentError if json_str.empty?
    
    begin 
        JSON.parse(json_str)
    rescue JsonDataError => e
        puts "JSONパース失敗"
        raise e
    end
end


# 呼び出し(正常)
begin
    result1 = parse_json_data('{"name": "Bob", "age": 25}')
    p result1
rescue JsonDataError => e
    puts "エラーメッセージ#{e.message}"
rescue => e 
    puts "その他のエラー#{e.message}"
end

# 引数が空白
begin
    result1 = parse_json_data("")
    p result1
rescue JsonDataError => e
    puts "エラーメッセージ#{e.message}"
rescue => e 
    puts "その他のエラー#{e.message}"
end

# JSONではなくハッシュ
begin
    result1 = parse_json_data('{name: "Bob", age: 25}')
    p result1
rescue JsonDataError => e
    puts "エラーメッセージ#{e.message}"
rescue => e 
    puts "その他のエラー#{e.message}"
end