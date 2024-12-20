class Product
    attr_accessor :name, :price, :stock, :status
    def initialize (name,price,stock)
        @name = name
        @price = price
        @stock = stock
        @status = update_status
    end
    def update_status
        if @stock > 0
            @status = "在庫あり"
        elsif @stock == 0 && @status != "入荷待ち"
            @status = "在庫切れ"
        end
    end

    def restock_status
        if @status == "在庫切れ"
            @status = "入荷待ち"
            puts "在庫状況を#{@status}に変更しました"
        else
            puts "現在入荷待ち、もしくは在庫がある状態なので新たに入荷できません"
        end
    end

end

class Order
    attr_accessor :name, :count
    def initialize(name,count)
        @name = name 
        @count = count # この数は注文数
    end
end

class Inventory
    def initialize
        @products = []
        @orders = []
    end

    def add_product(product)
        @products << product #商品を管理
    end

    def place_order(product,count)
        inventory = @products.find {|i| i == product} # 在庫の中の商品と今回の注文する商品の同じものがないか探す
        if inventory # 該当する在庫商品があれば
            if inventory.stock >= count
                inventory.stock -= count #残りの在庫数
                puts "注文成功 (在庫#{inventory.stock})"
                inventory.update_status # 在庫状況を更新
                @orders << Order.new(product,count) #オーダーを在庫システムで管理
            else
                puts "注文失敗(在庫切れ)"
            end
        else
            puts "該当する商品がありません。もう一度商品名をご確認ください"
        end
    end

    def cancel_order(product,count)
        order = @orders.find {|i| i.name == product && i.count == count} # 注文した内容(商品名、注文数)とキャンセルする予定のこれらが一致するものを探す
        if order # 該当する注文があった場合
            puts "注文をキャンセルしました 商品名:#{product.name} 数量: #{count}"
            @orders.delete(order) # 注文一覧からキャンセルした商品を削除

            # 製品の情報を更新する必要がある
            canceled_product = @products.find {|i| i == product} # 在庫の中にある商品からキャンセルした商品と一致するものを検索
            canceled_product.stock += count # 
            canceled_product.update_status # 在庫状況を更新
        else
            puts "該当する注文は見つかりませんでした"
        end
    end

    def restock_product(product,count = nil)
        restock_product = @products.find {|i| i == product} # @products から再入荷する予定の商品と同じものを決める
        #countに指定がなかった場合
        return product.restock_status if restock_product && count == nil  # 数量の指定がない場合は、在庫状況を入荷待ちにする
        # countに指定があった場合
        
        if restock_product
            puts "商品名: #{product.name} 数量: #{count}個 再入荷しました。"
            restock_product.stock += count # 入荷する
            restock_product.update_status # 商品状態を更新
        else
            puts "ご指定の商品が在庫の中にありません。もう一度商品名をご確認ください"
        end
    end

    def list_products
        puts "------------------在庫一覧-------------"
        @products.each {|i| puts "商品名: #{i.name}"}
    end
end

product1 = Product.new("ノートPC", 1000, 5)       # 在庫あり
product2 = Product.new("スマートフォン", 700, 0)  # 在庫切れ

inventory = Inventory.new
inventory.add_product(product1)
inventory.add_product(product2)

inventory.place_order(product1, 2)   # 注文成功（在庫3）→ 在庫ありのまま
inventory.place_order(product2, 1)   # 注文失敗（在庫切れ）

inventory.cancel_order(product1, 2)  # キャンセル成功（在庫5に戻る）→ 在庫あり

# product2は在庫0で在庫切れ、restock_productを呼んで補充待ちにする
inventory.restock_product(product2) # 初回呼び出しで入荷待ちに変更（在庫はまだ0）

# 商品が実際に届いたとして再度restock_productで在庫数を増やす
inventory.restock_product(product2, 5)  # 補充成功（在庫5になり、在庫ありに戻る）

inventory.list_products
