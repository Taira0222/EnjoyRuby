begin
    text = File.read('urls.txt')

    url_regex = %r{https?://[A-Za-z0-9.-]+(?:/[^\s]*)?}

    urls = text.scan(url_regex)

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