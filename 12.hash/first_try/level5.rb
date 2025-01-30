shops ={}

shops['Chiba'] = 100000
shops['Kanagawa'] = 150000
shops['Tokyo'] = 300000

total = 0
shops.each do |_,sales|
    total += sales
end
puts "店舗総売り上げ: #{total}円"

select_shop = 'Kanagawa'
selected_shops = shops.select{|_,sales| sales == select_shop}
selected_shops.each do |name,sales|
    puts "店舗名#{name} 売り上げ#{sales}円"
end

price = 120000
sales_higher_shops = shops.select{|_,sales| sales > price}
sales_higher_shops.each do |name,sales|
    puts "店舗名#{name} 売り上げ#{sales}円"
end