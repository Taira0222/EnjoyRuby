# Bookクラスに本の情報を記録する
class Book
    attr_reader :title, :author, :isbn, :borrowed

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
        # 貸出状況をみて書籍を貸すことができるかの処理をしている
        @books.each do |book|
            if  book.borrowed == false && book.isbn == borrow_isbn
                puts "ご利用ありがとうございます。"
                book.borrowed = true
            else
                puts "現在ほかの方がご利用されているのでお貸出できません"
            end
            # 図書館にその本がない場合の例外処理
                puts "お探しになっている書籍はこちらの図書館にございません。"  unless borrow_isbn == book.isbn
        end
    end
    
    # 書籍の返却の処理
    def return_book(return_isbn)
        @books.each do |book|
            if  book.borrowed == true && book.isbn == return_isbn
                puts "ご返却ありがとうございます。またのご利用をお待ちしております"
                book.borrowed = false
            elsif book.borrowed == false && book.isbn == return_isbn
                puts "図書館に同じISBNの書籍がありますが、貸出されている記録がありません。もう一度ISBNをご確認ください"
            else
                puts "こちらの書籍と一致するISBNが図書館に存在しません。"
            end
        end
    end

    # 検索機能実装前にミス発覚
        

end

library = Library.new

# 書籍を追加
library.add_books(Book.new("The Great Gatsby", "F. Scott Fitzgerald", "9780743273565"))
library.add_books(Book.new("To Kill a Mockingbird", "Harper Lee", "9780060935467"))
library.add_books(Book.new("1984", "George Orwell", "9780451524935"))
library.add_books(Book.new("Pride and Prejudice", "Jane Austen", "9780141439518"))


# 書籍を貸出する
library.borrowed_book("9780743273565") # 貸出できる
library.borrowed_book("9780060935467") # 貸出できる
library.borrowed_book("9780316769488") # 図書館に在庫がないので貸出できない
library.borrowed_book("9780060935467") # すでに貸出されている

# 書籍を返却する
library.return_book("9780743273565") # 返却できる
library.return_book("9780451419439") # 一致するISBNがない
library.return_book("9780141439518") # 図書館にはあるが貸出をされている記録なし


#  書籍の検索機能
def search_book(search_isbn)

