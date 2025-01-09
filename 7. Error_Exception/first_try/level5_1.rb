def safe_read_file(file_path)
    if file_path.empty?
        raise ArgumentError, "ファイル名が空です"
    end

    begin
        file = File.read(file_path)
        return file 
    rescue Errno::ENOENT => e
        puts "ファイルが存在しません"
        raise e
    end
end

begin
    safe_read_file("")
rescue ArgumentError => e
    puts "引数エラー #{e.message}"
end

begin
    safe_read_file("No_exit_file.md")
rescue Errno::ENOENT => e
    puts "再スロー補足 #{e.message}"
end
    