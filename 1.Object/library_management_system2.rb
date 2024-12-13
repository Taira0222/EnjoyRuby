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