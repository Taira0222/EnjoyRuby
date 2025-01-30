def extract_number(file_path)
    begin
        File.open(file_path) do |file|
            file.each_line do |line|
                line = line.chomp
                puts line if line =~ /\A\d{2,4}-\d{3,4}-\d{4}\z/
            end
        end             
    rescue Errno::ENOENT => e
        puts "ファイルが存在しません #{e.message}"
    end
end

extract_number('unknown.txt')
extract_number('phone_list.txt')