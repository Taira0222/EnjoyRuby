# 解けなかった
require 'date'

begin
    results = []
    pattern1 = /(\d{4})-(\d{2})-(\d{2})\s+(\d{1,2}):(\d{2})(?::(\d{2}))?/

    pattern2 = /(\d{4})\/(\d{2})\/(\d{2})\s+(\d{1,2}):(\d{2})(AM|PM)/i

    pattern3 = /(\d{4})(\d{2})(\d{2})\s+(\d{1,2}):(\d{2})/      

    text = File.read('mixed_dates.txt')

    text.scan(pattern1) do |y,m,d,h,min,sec|
        sec = sec || '00'
        dt_str = "#{y}-#{m}-#{d} #{h}:#{min}"
        results << dt_str
    end

    text.scan(pattern2) do |y,m,d,h,min,ampm|
        hour_24 = h.to_i # 正規表現で取り出された数はintegerではなく文字列
        hour_24 += 12 if ampm.upcase == 'PM' && hour_24 < 12
        hour_24 = 0 if ampm.upcase == 'AM' && hour_24 == 12
        dt_str = "#{y}-#{m}-#{d} #{format('%02d', hour_24)}:#{min}"
        results << dt_str
    end

    text.scan(pattern3) do |y,m,d,h,min|
        dt_str = "#{y}-#{m}-#{d} #{h}:#{min}"
        results << dt_str
    end

    if results.empty?
        puts '日付時刻が見つかりませんでした'
    else
        puts '抽出した日付時刻(YYYY-MM-DD HH:MM 形式):'
        results.each {|i|puts i}
    end

rescue Errno::ENOENT
    puts "ファイルが見つかりませんでした。ファイル名を確認してください。"
rescue => e
    puts "エラーが発生しました: #{e.message}"
end
    