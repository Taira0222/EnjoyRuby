# 解答例1: DynamicProperties クラス

## 要件おさらい
    - 未定義のゲッター・セッターが呼ばれたとき、動的にプロパティを追加・取得できるようにする。
    - method_missing と respond_to_missing? を利用する。
    - セッターで複数引数が渡された場合はエラーを投げる。
    - 存在しないプロパティのゲッターは nil を返す。

### 実装例
```ruby
class DynamicProperties
  def initialize
    # 動的プロパティをハッシュで管理
    @props = {}
  end

  def method_missing(method_name, *args)
    method_str = method_name.to_s

    # セッターかどうかを判定
    if method_str.end_with?("=")
      # セッターの場合は引数が1つだけであることを確認する
      if args.size != 1
        raise ArgumentError, "Setter must have exactly one argument"
      end

      # "foo=" → "foo" というプロパティ名に変換
      prop_name = method_str.chomp("=")
      @props[prop_name] = args.first
    else
      # ゲッターの場合
      @props[method_str]  # 存在しない場合はnilが返る
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    # どんなメソッド名（ゲッター/セッター）が来ても true にする
    # ただし、クラスが実際に定義しているメソッドは通常の動きを維持
    true
  end
end

# --- 動作確認例 ---
# dp = DynamicProperties.new
# dp.name = "Ruby"
# p dp.name           # => "Ruby"
# p dp.age           # => nil (存在しないため)
# dp.age = 20
# dp.age = 30, 40     # => ArgumentError (引数が複数)
```

# 解答例2: 図書館管理システム
## 要件おさらい
### Book クラス
    title, author, published_year の3つの属性
    info メソッド
### EBook クラス (Book を継承)
    file_size_mb, format 属性追加
    info をオーバーライドして "[format, file_size_mbMB]" を末尾に追加
### LendingSystem モジュール
    lend(book), return_book(book), lent_books の3メソッドを実装
### Library クラス
    include LendingSystem
    蔵書(@books)を管理し、add_book, remove_book, search_by_title を実装

```ruby
# --- Book クラス ---
class Book
  attr_reader :title, :author, :published_year

  def initialize(title, author, published_year)
    @title = title
    @author = author
    @published_year = published_year
  end

  def info
    "#{title}(#{author}, #{published_year})"
  end
end

# --- EBook クラス (Bookを継承) ---
class EBook < Book
  attr_reader :file_size_mb, :format

  def initialize(title, author, published_year, file_size_mb, format)
    # 親クラスの初期化
    super(title, author, published_year)
    # 追加属性をセット
    @file_size_mb = file_size_mb
    @format = format
  end

  def info
    # 親クラスのinfoに文字列を追加
    "#{super} [#{format}, #{file_size_mb}MB]"
  end
end

# --- LendingSystem モジュール ---
module LendingSystem
  def lend(book)
    @lent_books ||= []

    # すでに貸出中のタイトルがあるかどうかを判定
    if @lent_books.any? { |b| b.title == book.title }
      # 同じタイトルを2回貸し出すのを禁止
      raise "Book '#{book.title}' is already lent out."
    else
      @lent_books << book
    end
  end

  def return_book(book)
    @lent_books ||= []
    @lent_books.delete_if { |b| b.title == book.title }
  end

  def lent_books
    @lent_books ||= []
  end
end

# --- Library クラス ---
class Library
  include LendingSystem

  # 蔵書を管理する配列
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def remove_book(book)
    @books.delete(book)
  end

  def search_by_title(title)
    @books.select { |book| book.title == title }
  end
end

# ----------------- 動作確認例 -----------------
# library = Library.new
#
# ruby_book = Book.new("Ruby入門", "Alice", 2020)
# ebook_js  = EBook.new("JavaScript入門", "Bob", 2019, 10, "EPUB")
#
# library.add_book(ruby_book)
# library.add_book(ebook_js)
#
# library.lend(ruby_book)
# library.lend(ebook_js)
# p library.lent_books.map(&:info)
# # => ["Ruby入門(Alice, 2020)", "JavaScript入門(Bob, 2019) [EPUB, 10MB]"]
#
# library.return_book(ruby_book)
# p library.lent_books.map(&:info)
# # => ["JavaScript入門(Bob, 2019) [EPUB, 10MB]"]
#
# p library.search_by_title("Ruby入門").map(&:info)
# # => ["Ruby入門(Alice, 2020)"]
#
# library.remove_book(ruby_book)
# p library.search_by_title("Ruby入門")
# # => []
```