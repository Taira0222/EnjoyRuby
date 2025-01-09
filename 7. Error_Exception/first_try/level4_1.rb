def read_file_contents(file)
    begin 
        File.open(file) do |file|
            puts file
        end
        return file
    rescue  Errno::ENOENT
        puts "ファイルが見つかりませんでした"
        return nil
    end
end


read_file_contents("taira.md")