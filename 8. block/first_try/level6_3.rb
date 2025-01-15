def read_file_with_progress(filepath)
    total_line = 0
    File.foreach(filepath) do |line|
        total_line += 1
    end
    File.foreach(filepath).with_index do |line,index|        
        progress = (((index + 1).fdiv(total_line))*100).round
        yield(line,progress)
    end
end

read_file_with_progress("practice.md") do |line, progress|
    puts "[#{progress}%] #{line}"
end
# 実行例:
# [0%] 1行目の内容
# [20%] 2行目の内容
# ... など