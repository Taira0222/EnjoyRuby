def write_to_file(file_path)
    begin 
        File.open(file_path, "w") do |file|
            file.puts "書きかえました"
        end
    rescue Errno::EISDIR, StandardError
        puts "書き込みできませんでした"
    end
end

write_to_file("test.md")
write_to_file("test/")

