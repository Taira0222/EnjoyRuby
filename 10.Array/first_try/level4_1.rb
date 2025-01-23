begin
    arr =[]
    File.foreach("input.txt") do |line|
        arr << line.gsub(/\n/,"")
    end
    puts arr.uniq.sort
rescue Errno::ENOENT
    puts "ファイルが見つかりません" 
end

# 改行版
begin
    text = File.read("input.txt")
    arr = text.split('\n')

    puts arr.uniq.sort
rescue
    puts "ファイルが見つかりません" 
end