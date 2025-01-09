def open_user_account(username,age)
    return ArgumentError if username.empty?
    return ArgumentError if age < 0

    begin
        File.open("user.text", a) do |f|
            f.puts "#{username}, #{age}"
        end
    rescue StandardError => e
        puts "エラーメッセージ #{e.message}"
        raise e
    end
end

# 正常の場合
begin 
    open_user_account("takeshi",27)
rescue ArgumentError => e
    puts "引数エラー #{e.message}"
rescue => e
    puts "その他のエラー #{e.message}"
end

# username が空


begin 
    open_user_account("",27)
rescue ArgumentError => e
    puts "引数エラー #{e.message}"
rescue => e
    puts "その他のエラー #{e.message}"
end

# ageが負のケース
begin
    open_user_account("bob", -5)
  rescue ArgumentError => e
    puts "引数エラー: #{e.message}"
  rescue => e
    puts "その他のエラー: #{e.message}"
  end