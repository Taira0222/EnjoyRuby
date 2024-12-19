class Book
    attr_accessor :title, :author, :isbn, :borrowed

    def initialize(title,author,isbn)
        @title= title
        @author = author
        @isbn = isbn
        @borrowed = false #初期値は利用可能のfalseに設定
    end
end

class Library
    # 追加された本を記録する機能
    def initialize
        @books = []
    end

    # 本をlibraryの倉庫に入れるイメージ
    def add_book(book)
        @books << book
        puts "タイトル:#{book.title} を追加しました"
    end

    def borrow_book(isbn)
        book = @books.find{|book| book.isbn == isbn } #=> お客様のisbnと最初に該当した書籍を抜き出す
        if book
            if book.borrowed == false
                puts "ご利用ありがとうございます。 図書館に在庫があったのでお貸出しいたします"
                book.borrowed = true # @booksの中の貸出状況を貸出中にする
            else
                puts "こちらのISBNに該当する書籍はございますが、現在ほかの方がレンタル中のためお貸出しすることができません"
            end
        else   
            puts "こちらのISBNに該当する書籍は本図書館で見つかりませんでした。もう一度ISBNをご確認ください"
        end
    end

    def return_book(isbn)
        book = @books.find{|book| book.isbn == isbn }
        if book
            if book.borrowed == true
                puts "ご返却ありがとうございます。 またのご利用をお待ちしております"
                book.borrowed = false # @booksの中の貸出状況を利用可能にする
            else
                puts "こちらのISBNに該当する書籍はございますが、すでに返却済みの書籍となります。もう一度ISBNをご確認ください"
            end
        else   
            puts "こちらのISBNに該当する書籍は本図書館で見つかりませんでした。もう一度ISBNをご確認ください"
        end
    end

    def search_title(title)
        books = @books.select{|book| book.title.include?(title)}
        if books.empty?
            puts "お探しのタイトルに該当する書籍はございません。"
        else
            puts "お探しのタイトルに合致する書籍が見つかりました" 
            books.each{|i| puts "タイトル名:#{i.title}"}
        end
    end

    def search_author(author)
        books = @books.select{|book| book.author.include?(author)}
        if books.empty?
            puts "お探しのタイトルに該当する書籍はございません。"
        else
            puts "お探しのタイトルに合致する書籍が見つかりました" 
            books.each{|i| puts "著者名: #{i.author}" }
        end
    end


end


book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", 9780743273565)
book2 = Book.new("To Kill a Mockingbird", "Harper Lee", 9780060935467)
book3 = Book.new("1984", "George Orwell", 9780451524935)
book4 = Book.new("Pride and Prejudice", "Jane Austen", 9780141439518)

puts "--------------本を追加する----------------/n"
library = Library.new
library.add_book(book1) # =>タイトル:The Great Gatsby を追加しました
library.add_book(book2) # =>タイトル:To Kill a Mockingbird を追加しました
library.add_book(book3) # =>タイトル:1984 を追加しました
library.add_book(book4) # =>タイトル:Pride and Prejudice を追加しました

puts "/n--------------本を借りる----------------"
library.borrow_book(9780743273565) #=> book1のisbnなので借りれる。 book1 = 貸出中
library.borrow_book(9780743273565) # => 貸出中なので貸せない
library.borrow_book(4546465465464) # => ISBNが存在しない
puts "/n--------------本を返却する----------------"
library.return_book(9780743273565) #=> 返却可能
library.return_book(9780743273565) # => 番号はあっているが、すでに返却ずみ
library.return_book(4546465465464) # => ISBNが存在しない
puts "/n--------------タイトルで検索する----------------"
library.search_title("To Kill a Mockingbird") #=>該当する本あり
library.search_title("Hello world") #=> 該当なし
puts "/n--------------著者で検索する----------------"
library.search_author("F. Scott Fitzgerald") #=>該当する本あり
library.search_author("Takeshi Goda")#=> 該当なし