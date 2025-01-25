# レベル4: 円の情報を管理するクラス
## 概要
半径を与えて初期化し、以下のようなメソッドを持つ Circle クラスを実装してください。

* diameter: 直径を返す
* area: 面積を返す（円周率は Math::PI を使用）
* circumference: 円周を返す
## 要件
1. クラス名: Circle
2. 属性:
    * radius (半径)
3. 初期化:
    * Circle.new(radius) で半径を設定する
4. インスタンスメソッド:
    * diameter
        * 直径（ 2 * radius ）を返す
    * area
        * 面積（ Math::PI * radius**2 ）を返す
    * circumference
        * 円周（ 2 * Math::PI * radius ）を返す
## 実行例
```ruby
circle = Circle.new(5)
p circle.diameter       # => 10
p circle.area           # => 78.53981633974483 (Math::PI * 25)
p circle.circumference  # => 31.41592653589793 (2 * Math::PI * 5)
```

# レベル5: 銀行口座クラス (クラス変数を使用)
## 概要
クラス変数やクラスメソッドを活用して、口座の総数や預金残高の合計を管理する BankAccount クラスを作成してください。

## 要件
1. クラス名: BankAccount
2. クラス変数・クラスメソッド
    クラス変数 @@total_accounts を利用し、生成された口座インスタンスの総数を管理する
    クラス変数 @@total_balance を利用し、すべての口座の残高合計を管理する
    BankAccount.total_accounts → 口座インスタンスの総数を返す
    BankAccount.total_balance → すべての口座の残高合計を返す
3. 属性
    name: 口座名義人 (String)
    balance: 残高 (数値、初期値0)
4. 初期化
    BankAccount.new(name, balance = 0) で口座名義と初期残高を設定。インスタンス生成時にクラス変数を更新する。
5. インスタンスメソッド
    deposit(amount) → 残高を増やす（同時にクラス変数の残高合計を更新）
    withdraw(amount) → 残高を減らす（同時にクラス変数の残高合計を更新）
    info → "口座名: xxx, 残高: yyy" の形式の文字列を返す
## 実行例
```ruby
account1 = BankAccount.new("Alice", 1000)
account2 = BankAccount.new("Bob")

account2.deposit(500)
account1.withdraw(200)

p account1.info  
# => "口座名: Alice, 残高: 800"

p BankAccount.total_accounts 
# => 2 (口座が2つある)

p BankAccount.total_balance  
# => 1300 (2つの口座の合計残高: 800 + 500)
```

# レベル6: ショッピングカートクラス
## 概要
複数の商品をまとめて管理し、合計金額の計算や商品削除などの機能を持つ ShoppingCart クラスを作成してください。商品は「名前、単価、数量」を持つデータとして扱います。

## 要件
1. クラス名: ShoppingCart
2. 属性
    items: カート内の商品リスト（配列）
        それぞれの商品は以下のようなハッシュまたはオブジェクトで表現してよい:{ name: "商品名", price: 1000, quantity: 2 }
3. 初期化
    ShoppingCart.new で空の @items を作成する
4. インスタンスメソッド
    1. add_item(name, price, quantity = 1)
        * 商品名 name、単価 price、数量 quantity を受け取り、既存商品と同名の商品があれば数量を足す。
        * 存在しなければ新規商品として @items に追加する。
    2. remove_item(name, quantity = 1)
        * カート内から name に一致する商品を探し、指定数だけ数量を減らす。
        * 数量が0以下になった商品はカートから削除する。
    3. total_price
        * カート内すべての商品の (price * quantity) の合計を返す。
    4. print_items
        * カート内の商品一覧を "商品名 x 数量: 小計(単価×数量)" の形で表示する。
        * 最後に "合計金額: xxx" を表示する。
## 実行例
```ruby

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

p cart.total_price
# => 450 (りんご3個分300 + バナナ1個分150)
```
