class Product
    attr_accessor :name, :price, :stock, :status

    def initialize(name,price,stock)
        @name = name 
        @price = price
        @stock = stock
        @status = stock > 0 ? "在庫あり" : "在庫切れ"
    end

    def update_status
        if @stock == 0
            @status = "在庫切れ"
        elsif @stock > 0
            @status = "在庫あり"
        end
    end
end


class Order
    attr_reader :product, :count

    def initialize(product,count)
        @product = product
        @count = count
    end
end

class Inventory
    def initialize
        @products = []
        @orders = []
    end

    def add_product(product)
        @products << product
    end

    def place_order(product, count)
    if product.stock >= count
      product.stock -= count
      product.update_status
      @orders << Order.new(product, count)
      puts "注文成功: 商品名: #{product.name}, 数量: #{count}"
    else
      puts "注文失敗: 商品名: #{product.name}, 在庫不足"
    end
  end

  def cancel_order(product, count)
    order = @orders.find { |o| o.product == product && o.count == count }
    if order
      product.stock += count
      product.update_status
      @orders.delete(order)
      puts "キャンセル成功: 商品名: #{product.name}, 数量: #{count}"
    else
      puts "キャンセル失敗: 該当する注文が見つかりません。商品名と注文した個数を再度ご確認ください"
    end
  end

  def restock_product(product, count)
    product.stock += count
    product.update_status
    puts "補充成功: 商品名: #{product.name}, 数量: #{count}"
  end

  def list_products
    puts "----------在庫一覧です--------------------------"
    @products.each do |product|
      puts "商品名: #{product.name}, 価格: #{product.price}円, 在庫数: #{product.stock}, ステータス: #{product.status}"
    end
  end
end

product1 = Product.new("ノートPC", 1000, 5)
product2 = Product.new("スマートフォン", 700, 0)

inventory = Inventory.new
inventory.add_product(product1)
inventory.add_product(product2)

inventory.place_order(product1, 2)   # 注文成功
inventory.place_order(product2, 1)   # 注文失敗（在庫切れ）

inventory.cancel_order(product1, 2)  # キャンセル成功
inventory.restock_product(product2, 5)  # 補充成功

inventory.list_products