class BankAccount
    @@total_accounts = 0 # totalの銀行口座数
    @@total_balance = 0 # totalの銀行残高

    def initialize(name,price = 0)
        @name = name
        @price = price
        @@total_accounts += 1 # インスタンスができるたびに口座の数をカウント
        @@total_balance += price # 口座を作る際のデポジットをtotalの残高に追加
    end

    # 銀行の口座数
    def self.total_accounts
        puts "Idaho銀行 口座総数:#{@@total_accounts}口座"
    end
    # 銀行の総金額
    def self.total_balance
        puts "Idaho銀行 口座金額合計:#{@@total_balance}円"
    end

    # お金を追加する機能
    def deposit(amount)
        @price += amount
        @@total_balance += amount
    end

    # 残高を減らす
    def withdraw(amount)
        @price -= amount
        @@total_balance -= amount
    end

    # 情報照会
    def info
        puts "口座名: #{@name}, 残高: #{@price}円"
    end
end

account1 = BankAccount.new("Alice", 1000)
account2 = BankAccount.new("Bob")

account2.deposit(500)
account1.withdraw(200)

account1.info 

BankAccount.total_accounts 
BankAccount.total_balance  