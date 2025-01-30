# 問題1(レベル4)
```ruby
# phone_extractor.rb
begin
  phones = []

  # ファイルを1行ずつ読み込み
  File.foreach('phone_list.txt') do |line|
    # 電話番号を正規表現で抽出
    line.scan(/\b\d{2,4}-\d{3,4}-\d{4}\b/) do |match|
      phones << match
    end
  end

  puts "抽出した電話番号:"
  phones.each { |phone| puts phone }

rescue Errno::ENOENT => e
  puts "ファイルが見つかりません: #{e.message}"
end
```

# 問題2(レベル4)
```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'

begin
  text = File.read('mixed_dates.txt')

  # シンプルに「4桁年-2桁月-2桁日 時:分(:秒)オプション」パターンの例
  pattern1 = /(\d{4})-(\d{2})-(\d{2})\s+(\d{1,2}):(\d{2})(?::(\d{2}))?/
  # 例: 2025-03-15 14:30  (秒は任意)

  # 別の形式: 2025/03/15 2:30PM, 2:30AMなど(12時間表記)
  pattern2 = /(\d{4})\/(\d{2})\/(\d{2})\s+(\d{1,2}):(\d{2})(AM|PM)/i

  # 区切りなし: 20250315 14:30
  pattern3 = /(\d{4})(\d{2})(\d{2})\s+(\d{1,2}):(\d{2})/

  # マッチ結果を格納する配列
  results = []

  # パターン1にマッチする部分を抽出
  text.scan(pattern1) do |y, m, d, hh, mm, ss|
    ss = ss || "00"  # 秒がなければ"00"
    # フォーマット変換
    dt_str = "#{y}-#{m}-#{d} #{hh}:#{mm}"
    results << dt_str
  end

  # パターン2にマッチ
  text.scan(pattern2) do |y, mo, d, hh, mm, ampm|
    # 12時間表記を24時間に変換
    hour_24 = hh.to_i
    hour_24 += 12 if ampm.upcase == "PM" && hour_24 < 12
    hour_24 = 0 if ampm.upcase == "AM" && hour_24 == 12
    dt_str = "#{y}-#{mo}-#{d} #{format('%02d', hour_24)}:#{mm}"
    results << dt_str
  end

  # パターン3にマッチ
  text.scan(pattern3) do |y, mo, d, hh, mm|
    dt_str = "#{y}-#{mo}-#{d} #{hh}:#{mm}"
    results << dt_str
  end

  if results.empty?
    puts "日付時刻が見つかりませんでした。"
  else
    puts "抽出した日付時刻(YYYY-MM-DD HH:MM 形式):"
    results.each { |res| puts res }
  end

rescue Errno::ENOENT
  puts "ファイルが見つかりませんでした。ファイル名を確認してください。"
rescue => e
  puts "エラーが発生しました: #{e.message}"
end
```

# 問題3(レベル4)
```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

begin
  text = File.read('urls.txt')

  # シンプルなURL検出用の正規表現例
  # - http or https
  # - ://
  # - ドメイン部分(英数字,ハイフン,ドット)
  # - パスは任意(クエリや#含む場合もあるので最短の例)
  url_pattern = /\bhttps?:\/\/[A-Za-z0-9\-\.]+(?:\/[^\s]*)?\b/

  urls = text.scan(url_pattern)

  if urls.empty?
    puts "URLは見つかりませんでした。"
  else
    puts "検出されたURL一覧:"
    urls.each { |u| puts u }
  end

rescue Errno::ENOENT
  puts "ファイルが見つかりません。ファイル名を確認してください。"
rescue => e
  puts "想定外のエラーが発生しました: #{e.message}"
end
```
