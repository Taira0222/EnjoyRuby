# 問題1(レベル4)
```ruby
# file_read.rb (例)

begin
  text = File.read("input.txt")  # input.txtが存在しないとErrno::ENOENTが発生
  lines = text.split("\n")       # 行ごとに分割して配列化
  lines = lines.uniq.sort        # 重複を除去してソート

  lines.each do |line|
    puts line
  end
rescue Errno::ENOENT
  puts "ファイルが見つかりません"
end
```

# 問題2 (レベル4)

```ruby
# collect_foods.rb (例)

def collect_foods
  result = []

  loop do
    print "好きな食べ物を入力してください（空行で終了）: "
    input = gets&.chomp  # nilガードで安全に入力取得
    break if input.nil? || input.empty?

    result << input
  end

  result
end

def main
  foods = collect_foods
  puts "== 入力された配列(逆順) =="
  puts foods.reverse

  puts "== 入力数: #{foods.size}件 =="
end

# スクリプトを実行するときに呼び出す
if __FILE__ == $0
  main
end
```

# 問題3 (レベル5)
```ruby
# array_exercise.rb

def filter_long_words(words)
  # 文字数が5文字以上の要素だけを返す
  words.select { |word| word.length >= 5 }
end


# array_exercise_spec.rb
require_relative 'array_exercise'

RSpec.describe 'filter_long_words' do
  it 'returns words with length >= 5' do
    input = ["apple", "dog", "banana"]
    result = filter_long_words(input)
    expect(result).to eq(["apple", "banana"])
  end

  it 'returns an empty array if no words satisfy the condition' do
    input = ["hi", "cat", "dog"]
    result = filter_long_words(input)
    expect(result).to eq([])
  end
end


# 実行方法
rspec array_exercise_spec.rb
```

# 問題4 (レベル5)
```ruby
# csv_sort.rb
require 'csv'

users = []

CSV.foreach("users.csv", headers: true) do |row|
  # rowはCSV::Rowオブジェクト
  # row["name"], row["age"] などで取得可能
  users << {
    name: row["name"],
    age:  row["age"].to_i
  }
end

# ageの昇順にソート
sorted_users = users.sort_by { |u| u[:age] }

puts "ソート結果:"
sorted_users.each do |user|
  puts "#{user[:name]} (#{user[:age]})"
end
```

# 問題5 (レベル6)
```ruby
# task.rb

class Task
  attr_accessor :title, :done

  def initialize(title, done=false)
    @title = title
    @done  = done
  end
end

def complete_all(tasks)
  tasks.each do |task|
    # 未完了なら完了にする
    task.done = true unless task.done
  end
  tasks
end

# テスト実行例
if __FILE__ == $0
  tasks = [
    Task.new("買い物"),
    Task.new("掃除"),
    Task.new("部屋の模様替え", true) # すでに完了済み
  ]

  complete_all(tasks)

  tasks.each do |t|
    puts "#{t.title} -> done=#{t.done}"
  end
end
```

# 問題6 (レベル6)
```ruby
# flatten_articles.rb

articles_by_category = [
  ["Ruby入門", "Rails実践"],
  ["AWS概要", "Linux基礎", "Docker超入門"],
  ["JavaScript ES6", "Node.js活用"]
]

all_articles = articles_by_category.flatten
sorted_articles = all_articles.sort  # アルファベット・五十音順など

puts "== 全記事一覧 (ソート済) =="
sorted_articles.each { |art| puts art }

puts "== 記事数 =="
puts all_articles.size
```

# 問題7(レベル7)

```ruby
# benchmark_array.rb
require 'benchmark'

arr = Array.new(1_000_000) { rand(1..100) }

time_map = Benchmark.measure do
  new_arr = arr.map { |n| n * 2 }
end

time_reject = Benchmark.measure do
  odd_arr = arr.reject { |n| n < 50 }
end

puts "map    : #{time_map.real}秒"
puts "reject : #{time_reject.real}秒"
```

# 問題8 (レベル7)
```ruby
# user.rb

class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age  = age
  end
end

module ArrayUtils
  def self.pluck(objects, attr_name)
    objects.map { |obj| obj.send(attr_name) }
  end

  # 例えば「ArrayUtils.name_of(users)」のように呼べるメソッドを
  # 動的に定義する場合は method_missing や define_method を活用する。
  #
  # def self.method_missing(method, *args, &block)
  #   if method.to_s =~ /^(\w+)_of$/
  #     attr_name = $1.to_sym
  #     return pluck(args.first, attr_name)
  #   end
  #   super
  # end
end

# テスト例
if __FILE__ == $0
  users = [
    User.new("Alice", 30),
    User.new("Bob",   25),
    User.new("Carol", 35)
  ]

  names = ArrayUtils.pluck(users, :name)
  ages  = ArrayUtils.pluck(users, :age)

  puts "Names: #{names.inspect}"
  puts "Ages : #{ages.inspect}"

  # [オプション] method_missingを使うとこんなイメージ
  # puts "Names by method_missing: #{ArrayUtils.name_of(users)}"
end
```
