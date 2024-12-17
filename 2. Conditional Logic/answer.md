# 問1 答え
※コメントよりコードに異常があるため、12/17に確認する
```ruby
class Task
    attr_accessor :name, :assignee, :status

    def initialize(name,assignee)
        @name = name
        @assignee = assignee
        @status = "未着手" # 新しいタスクはすべて未着手
    end
end
class TeamMember
    attr_accessor :name, :tasks
    def initialize(name)
        @name = name
        @tasks =[]
    end

    def add_task(task)
        tasks << task
    end
end

class TaskManager
    def initialize
        @tasks = []
    end

    def add_task(task,member)
        member.add_task(task)
        @tasks << task
        puts "タスク「#{task.name}」が担当者「#{member.name}」に追加されました"
    end
    
    def start_task(task)
        if task.status == "未着手"
            task.status = "進行中"
            puts "タスク「#{task.name}」が進行中に変わりました"
        else
            puts "タスク「#{task.name}」は未着手でないため、開始できません"
        end
    end

    def complete_task(task)
        if task.status == "進行中"
            task.status = "完了"
            puts "タスク「#{task.name}」は完了しました"
        else
            puts "タスク「#{task.name}」は進行中でないため、完了できません"
        end
    end

    def hold_task(task)
        if task.status == "進行中"
            task.status = "保留"
            puts "タスク「#{task.name}」は保留になりました"
        else
            puts "タスク「#{task.name}」は進行中でないため、保留にすることができません"
        end
    end

    def resume_task(task)
        if task.status == "保留"
            task.status = "進行中"
            puts "タスク「#{task.name}」は再開され、進行中になりました"
        else
            puts "タスク「#{task.name}」は保留でないため、再開できません"
        end
    end

    def delete_task(task)
        if task.status == "未着手" || task.status == "完了"
            @tasks.delete(task) # Taskmanagerクラスのインスタンス変数@tasks配列内のtaskをdelete
            task.assignee.tasks.delete(task)
            puts "タスク「#{task.name}」が削除されました"
        else
            puts "タスク「#{task.name}」が未着手または完了でないため、削除できません"
        end
    end

    def list_tasks
        puts "\n=== タスク一覧 ==="
        @tasks.each {|task| puts task}
        puts "=================\n\n"
    end
end

# タスクの作成
task1 = Task.new("Write Report", TeamMember.new("Taira"), "高")
task2 = Task.new("Fix Bug", TeamMember.new("Alex"), "中")
task3 = Task.new("Prepare Presentation", TeamMember.new("Taira"), "低")

# チームメンバーの作成
member1 = TeamMember.new("Taira")
member2 = TeamMember.new("Alex")

# タスクの管理
manager = TaskManager.new
manager.add_task(task1, member1)
manager.add_task(task2, member2)
manager.add_task(task3, member1)

# タスクの状態変更
manager.start_task(task1)     # 「未着手」→「進行中」
manager.complete_task(task1)  # 「進行中」→「完了」
manager.hold_task(task2)      # 「未着手」のため、保留不可
manager.start_task(task2)     # 「未着手」→「進行中」
manager.hold_task(task2)      # 「進行中」→「保留」
manager.resume_task(task2)    # 「保留」→「進行中」

# タスクの削除
manager.delete_task(task1)    # 削除成功（完了済み）
manager.delete_task(task2)    # 削除失敗（進行中）

# タスク一覧の表示
manager.list_tasks
```

# 問2 答え
```ruby
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
```
