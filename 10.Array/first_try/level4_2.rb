puts "好きな食べ物を入力してください（終了時は空行）"
def collect_foods
    arr =[]
    loop do
        item = gets.chomp
        break if item.empty?
        arr << item
    end
    arr
end

def main
    foods = collect_foods

    puts foods.reverse
    puts "入力数: #{foods.length}件"
end

main