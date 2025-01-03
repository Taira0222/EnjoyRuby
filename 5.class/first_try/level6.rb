class ShoppingCart
    def initialize
        @items = [] # itemを保存するリストを作成する
    end

    def add_item(name,price,quantity = 1)
        item = @items.find{|item| item[:name] == name}
        if item
            item[:quantity] += quantity
        else
            @items << {name: name, price: price, quantity: quantity}
        end
    end

    def remove_item(name,quantity = 1)
        item = @items.find{|item| item[:name] == name}
        if item
            item[:quantity] -= quantity
            return @items.delete(item) if item[:quantity] <= 0
        else
            puts "削除する予定の商品がありません"
        end
    end
    
    def total_price
        total_cost = 0
        @items.each do |item|
            total_cost += item[:price] * item[:quantity]
        end
        puts "カートの合計金額: #{total_cost}円"
    end

    def print_items
        temp_total_cost = 0
        @items.each do |item|
            puts "#{item[:name]} x #{item[:quantity]}: #{item[:price]* item[:quantity]}円 "
            temp_total_cost += item[:price]* item[:quantity]
        end
        puts "合計金額: #{temp_total_cost}円"
    end
end

cart = ShoppingCart.new
cart.add_item("りんご", 100, 3)    # りんごを3個
cart.add_item("バナナ", 150, 2)   # バナナを2個
cart.add_item("りんご", 100, 2)    # りんごを追加で2個(合計5個になる)

cart.print_items
# りんご x 5: 500
# バナナ x 2: 300
# 合計金額: 800

cart.remove_item("りんご", 2)      # りんごを2個減らす → 残り3個
cart.remove_item("バナナ")         # バナナを1個減らす → 残り1個

cart.total_price
# => 450 (りんご3個分300 + バナナ1個分150)