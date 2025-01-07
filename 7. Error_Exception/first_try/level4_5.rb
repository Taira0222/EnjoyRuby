def count_file_lines(file_path)
    begin
        file = File.read(file_path)
        file.lines.size
    rescue Errno::ENOENT
        puts "ファイルが存在しません"
        return -1
    rescue => e
        puts "エラーが発生しました エラーメッセージ#{e.message}"
        return -1
    end
end


p count_file_lines("test.md")
