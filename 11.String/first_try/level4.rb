def filltering_log(file_path)
    result = []
    File.foreach(file_path) do |line|
        result << line.strip.split(/\s+/)
    end
    result

end

p filltering_log('access.log')

# 改良版
def filltering_log2(file_path)
    result = []
    File.foreach(file_path) do |line|
        line = line.strip
        next if line.empty?

        collums = line.split(/\s+/)
        result << collums
    end
end

p filltering_log('access.log')