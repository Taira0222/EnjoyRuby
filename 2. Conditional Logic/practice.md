# 問題1: タスク管理システム
## 概要
複数のチームメンバーがタスクを管理するシステムを作成してください。タスクには「未着手」「進行中」「完了」「保留」の状態があり、状態に応じた操作や制限が存在します。

## 要件
1. タスクには以下の情報が含まれます：
* タスク名
* 担当者
* ステータス（"未着手"、"進行中"、"完了"、"保留"）
2. 以下の操作を実装してください：
* タスクの開始: 「未着手」状態のタスクのみ「進行中」にできます。
* タスクの完了: 「進行中」のタスクのみ「完了」にできます。
* タスクの保留: 「進行中」のタスクを「保留」にできます。保留中のタスクは再開可能です。
* タスクの削除: 「未着手」または「完了」のタスクのみ削除できます。
3. 担当者ごとにタスクを管理し、タスク一覧を表示する機能を実装してください。
4. タスクの状態は以下のように遷移します：
* 「未着手」→「進行中」
* 「進行中」→「完了」
* 「進行中」→「保留」
* 「保留」→「進行中」
## クラス設計
* Taskクラス: タスクの情報と状態を管理。
* TeamMemberクラス: チームメンバーと担当タスクを管理。
* TaskManagerクラス: タスクの追加、状態変更、削除、一覧表示を管理。
実装例
```ruby
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
### 問題のポイント
* 状態管理: タスクの状態が「未着手」「進行中」「完了」「保留」と変化し、それに応じた操作が必要です。
* 柔軟な設計: 複数のチームメンバーが関わり、タスクを担当者ごとに管理する仕組みが必要です。
* データの一貫性: 状態遷移が正しく行われるように、操作の制限が適切に働く必要があります。

この問題は状態管理、チームメンバー管理、データ操作が組み合わさっており、レベル7に適した難易度です。


# 問題2: オンラインショッピングの在庫管理システム
## 概要
オンラインショッピングサイトで商品を管理する在庫システムを作成してください。商品には在庫数があり、注文やキャンセルによって在庫が変動します。

## 要件
1. 商品には以下の情報があります：
* 商品名
* 価格
* 在庫数
* ステータス（"在庫あり"、"在庫切れ"、"入荷待ち"）
2. 以下の操作を実装してください：
* 注文: 在庫がある場合のみ注文が可能。注文時に在庫数が減少し、在庫が0になるとステータスが「在庫切れ」になります。
* キャンセル: 注文をキャンセルすると在庫が戻り、ステータスが「在庫あり」に戻ります。
* 在庫補充: 商品の在庫を補充できます。在庫数が一定数以上になるとステータスが「在庫あり」になります。
3. 注文履歴を管理し、注文ごとの状態を確認できるようにしてください。
4. 状態の遷移は以下の通りです：
* 「在庫あり」→「在庫切れ」（在庫が0になった場合）
* 「在庫切れ」→「入荷待ち」（補充待ちの状態）
## クラス設計
* Productクラス: 商品情報と在庫状態を管理。
* Orderクラス: 注文情報を管理。
* Inventoryクラス: 在庫全体を管理し、注文や在庫補充を調整。
## 実装例
```ruby
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
```
## これらの問題の特徴
* 状態管理: 商品や本の状態（貸出中、在庫切れなど）によって操作が制限されます。
* 柔軟な設計: 複数のクラスが連携し、管理者や一般ユーザーの権限、在庫数や予約状況に応じた処理が必要です。
* データの一貫性: 状態遷移が正しく行われるよう、データ整合性を維持する必要があります。

これらの要素が含まれているため、レベル7相当の問題と言えます。