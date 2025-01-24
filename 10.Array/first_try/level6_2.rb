def flatten_sort(articles)
    articles.flatten.sort
end

articles_by_category = [
  ["Ruby入門", "Rails実践"],
  ["AWS概要", "Linux基礎", "Docker超入門"],
  ["JavaScript ES6", "Node.js活用"]
]

articles = flatten_sort(articles_by_category)
articles.each {|i| puts i}

puts "#{articles.length}記事"