# 問1の答え
```ruby
# Bookクラスに本の情報を記録する
class Book
    attr_accessor :title, :author, :isbn, :borrowed

    def initialize(title,author,isbn)
        @title = title
        @author = author
        @isbn = isbn
        @borrowed = false
    end

    # 本の情報を出力するメソッド
    def book_status
        puts "本のタイトル#{@title},著者#{@author},ISBN#{@isbn},貸出状態#{@borrowed}"
    end
end

class Library
    # 配列booksに本を格納するためのメソッド
    def initialize
        @books =[]
    end

    # 書籍を追加するメソッド
    def add_books(book)
        @books << book
        puts "追加されました：#{book.title}"
    end

    # 書籍を貸出するメソッド
    def borrowed_book(borrow_isbn)
        # 借りようとしてる書籍と図書館にある書籍のISBNが一致するものを選ぶ
        book = @books.find{|b| b.isbn == borrow_isbn}
        if book # book がそもそもないとこの処理が成り立たないのでここでもif文を書く必要あり(答えを見て追加)
            if book.borrowed
            puts "現在ほかの方がご利用されているのでお貸出できません"
            else
                puts "ご利用ありがとうございます。タイトル名: #{book.title}"
                book.borrowed = true
            end
        else # そもそもISBNが登録されていない場合
            puts "お探しになっている書籍はこちらの図書館にございません。"
        end
    end
    
    # 書籍の返却の処理
    def return_book(return_isbn)
        # 返そうとしてる書籍と図書館にある書籍のISBNが一致するものを選ぶ
        book = @books.find {|b|b.isbn == return_isbn}
        if book
            if book.borrowed
                puts "ご返却ありがとうございます。またのご利用をお待ちしております タイトル名: #{book.title}"
                book.borrowed = false
            else
                puts "図書館に同じISBNの書籍がありますが、貸出されている記録がありません。もう一度ISBNをご確認ください"
            end
        else
            puts "こちらの書籍と一致するISBNが図書館に存在しません。"
        end
    end

    # タイトルで検索
    def search_title(search_title)
        results = @books.select{|b|b.title.include?(search_title)}
        if results.any?
            results.each {|b| puts "タイトル: #{b.title}, 著者: #{b.author}, ISBN: #{b.isbn}"}
        else
            puts "お探しのタイトルの書籍は本図書館にはございません"
        end
    end

    # 著者で検索
    def search_author(search_author)
        results = @books.select{|b|b.author.include?(search_author)}
        if results.any?
            results.each {|b| puts "タイトル: #{b.title}, 著者: #{b.author}, ISBN: #{b.isbn}"}
        else
            puts "お探しの著者の書籍は本図書館にはございません"
        end
    end
        

end

library = Library.new

# 書籍を追加
puts "-------------------書籍を4つ追加-------------------"
library.add_books(Book.new("The Great Gatsby", "F. Scott Fitzgerald", "9780743273565"))
library.add_books(Book.new("To Kill a Mockingbird", "Harper Lee", "9780060935467"))
library.add_books(Book.new("1984", "George Orwell", "9780451524935"))
library.add_books(Book.new("Pride and Prejudice", "Jane Austen", "9780141439518"))


# 書籍を貸出する
puts "\n-------------------書籍を4つ貸出する-------------------"
library.borrowed_book("9780743273565") # 貸出できる
library.borrowed_book("9780060935467") # 貸出できる
library.borrowed_book("9780316769488") # 図書館に在庫がないので貸出できない
library.borrowed_book("9780060935467") # すでに貸出されている


# 書籍を返却する
puts "\n-------------------書籍を3つ貸出する-------------------"
library.return_book("9780743273565") # 返却できる
library.return_book("9780451419439") # 一致するISBNがない
library.return_book("9780141439518") # 図書館にはあるが貸出をされている記録なし

# タイトルで検索
puts "\n-------------------書籍を2つ検索する-------------------"
library.search_title("Great")
library.search_title("Good")

# タイトルで検索
puts "\n-------------------書籍を2つ検索する-------------------"
library.search_author("Harper Lee")
library.search_author("Taira")
```

# 問2の答え
```ruby
class Employee
    def initialize(name)
        @name = name
    end

    def generate_pay_slip(salary)
        puts "Name: #{@name}\nSalary: #{salary.round}円" #　浮動小数点は四捨五入をする
    end
end

class FullTimeEmployee < Employee
    # スキルごとの基本給を代入
    SKILL_LEVEL_SALARY ={
        "Beginner" => 200_000,
        "Intermediate" => 300_000,
        "Advanced" => 400_000
    }

    AGE_BONUS = 1000
    # 初期値を代入し、基本給をskill_levelにて判断する
    def initialize(name,age,skill_level)
        super(name)
        @age = age
        @skill_level = skill_level
        @base_salary = SKILL_LEVEL_SALARY[skill_level]
    end

    # 給与計算
    def calculate_salary
        @base_salary + @age * AGE_BONUS
    end
    # 給与明細を出力
    def generate_pay_slip
        super(calculate_salary)
    end
end

class PartTimeEmployee < Employee
    # 時給を定数として定義
    HOURLY_RATE = 1500

    def initialize(name,hours_worked)
        super(name)
        @hours_worked = hours_worked
    end

    def calculate_salary
        HOURLY_RATE * @hours_worked
    end
    # 給与明細を出力
    def generate_pay_slip
        super(calculate_salary)
    end
end

class ContractEmployee < Employee
    # 時給と残業代の割合を定数として定義
    HOURLY_RATE = 2000
    OVERTIME_RATE = 1.25
    
    def initialize(name,hours_worked)
        super(name)
        @hours_worked = hours_worked
    end

    def calculate_salary
        if @hours_worked > 160
            return HOURLY_RATE * (160 + (@hours_worked - 160)* OVERTIME_RATE ) # 働いた時間から160時間をオーバーした時間に残業代をかける
        else
            return HOURLY_RATE * @hours_worked
        end
    end
    def generate_pay_slip
        super(calculate_salary)
    end
end

# 正社員のインスタンスを作成
fulltimeemployee1 = FullTimeEmployee.new("Taira",27,"Beginner")
fulltimeemployee2 = FullTimeEmployee.new("Miho",31,"Intermediate")

puts "\n-----------------社員ごとに給与明細を発行---------------"
fulltimeemployee1.generate_pay_slip
puts "\n-----------------社員ごとに給与明細を発行---------------"
fulltimeemployee2.generate_pay_slip

# アルバイトのインスタンスを作成
parttimeemployee1 = PartTimeEmployee.new("Miho",60)
parttimeemployee2 = PartTimeEmployee.new("Taira",70)

puts "\n-----------------アルバイトごとに給与明細を発行---------------"
parttimeemployee1.generate_pay_slip
puts "\n-----------------アルバイトごとに給与明細を発行---------------"
parttimeemployee2.generate_pay_slip


# 契約社員のインスタンスを作成
contractemployee1 = ContractEmployee.new("Miho",180.5)
contractemployee2 = ContractEmployee.new("Taira",150)

puts "\n-----------------契約社員ごとに給与明細を発行---------------"
contractemployee1.generate_pay_slip
puts "\n-----------------契約社員ごとに給与明細を発行---------------"
contractemployee2.generate_pay_slip
```