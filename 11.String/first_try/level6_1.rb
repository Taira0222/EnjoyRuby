# できなかった
items = [["Apple", 120], ["Orange", 50], ["Juice", 1500.75]]

def format_price(price)
    formatted = sprintf("%.2f", price)

    formatted.gsub(/(\d)(?=(\d{3})+\.)/, "\\1,") #わからなかった
end

items.each do |(name,price)|
    puts "#{name}: ￥#{format_price(price)}"
end