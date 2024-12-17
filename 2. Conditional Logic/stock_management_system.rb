class Product
    attr_accessor :name, :price, :count, :status

    def initialize(name,price,count)
        @name = name 
        @price = price
        @count = count
        @status = "在庫あり" 
    end
end

class Order
    def initialize
        @orders = {}
    end

    def place_order(product,count)
        @orders[product] = count # @orderのハッシュにオーダーされた内容を入れる
    end

    def list_order
        puts "----------オーダー 一覧です--------------------------"
        @orders.each {|product,count| puts "商品名#{product}: #{count}個 注文されました" }
    end
end

class Inventory
    attr_accessor :inventorys
    def initialize
        @inventorys = []
    end

    def add_product(product)
        inventorys << product # セッターinbentorysを呼び出して、productを配列@inbectorysに代入
    end

    def place_order(product,count)
        same_product = @inventorys.find {|i| i == product} # @inventorys配列の中のproductと一致するモノを探す
        if same_product.count < count
            puts "注文数よりも在庫数が少ないため注文することができません"
        else
            puts "注文を受け付けました。商品名:#{product} 注文数: #{count}"
            same_product.count -= count
            Order.place_order(product,count) #Orderクラスにproductとorderされたcountを入れる
        end
    end
end

    # cancel_order, restock_product,list_products は30分では書けませんでした










product1 = Product.new("ノートPC", 1000, 5)
product2 = Product.new("スマートフォン", 700, 0)

inventory = Inventory.new
inventory.add_product(product1)
inventory.add_product(product2)

inventory.place_order(product1, 2)   # 注文成功
inventory.place_order(product2, 1)   # 注文失敗（在庫切れ）

inventory.cancel_order(product1, 1)  # キャンセル成功
inventory.restock_product(product2, 5)  # 補充成功

inventory.list_products