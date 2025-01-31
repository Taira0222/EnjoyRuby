# Introduction
This repository is created as an output for practicing what I learned from “Fun Ruby 6th Edition,” using ChatGPT o1 to generate and solve exercises. Although “Fun Ruby 6th Edition” is very understandable and covers a wide range of content, it provides fewer exercises, leaving my understanding somewhat superficial. By actually doing the exercises and working with code, I can deepen my comprehension.

Please note that the content of these exercises and solutions is based on AI and may not be entirely accurate, so use them with caution.
# Environment
The environment is as follows:

OS: Windows 11
Ruby 3.3.5

# Directory Structure
Each directory is separated by class or topic.
`first_try` is the directory where I solved the problems first.
`second_try` is the directory used for review by solving the problems again.
The file names follow the convention difficulty.rb. The difficulty levels are as follows:

### Level 1: Environment Setup & Intro
* Install Ruby and set up an environment that allows you to run puts "Hello, World!".
* Understand basic commands like ruby filename.rb.
* Even without much knowledge of the syntax, you can create a file and execute it.

### Level 2: Basic Syntax
* Work with basic data types such as variables/constants, strings, numbers, arrays, and hashes.
* Use control structures such as if, while, and each.
* Define methods and group simple processes.
* Roughly identify causes of errors from error messages.

### Level 3: Classes, Modules, and OOP Fundamentals
* Define your own classes, and understand/use instance variables and methods.
* Master array/hash methods like map, select, and find.
* Understand modules (module) and use include for code reuse.
* Read backtraces and do basic debugging.

### Level 4: Multi-File Development & Advanced Syntax
* Split code across multiple classes and files for better organization.
* Use exception handling (begin-rescue) to control behavior on errors.
* Understand blocks, procs, and yield to build flexible processes.
* Refactor your code using modules or method extraction to reduce duplication.

### Level 5: Standard Libraries & Internal Structure
* Skillfully use standard libraries such as Time, File, StringIO to streamline daily tasks.
* Deeply grasp Enumerator and Enumerable for more powerful iterative processing.
* Understand the Ruby object model, including self and scope, in detail.
* Write code with awareness of Ruby’s internals such as performance and memory use.

### Level 6: Advanced Error Handling, Debugging & Performance
* Make full use of raise, rescue, ensure, retry for complex error handling.
* Use traceback or debuggers (like byebug) for quick bug identification and fixes.
* Profile using tools like RubyProf and the standard benchmark library to optimize performance bottlenecks.
* Manage character encoding and internationalization (Encoding, I18n), among other concerns.

### Level 7: Metaprogramming & Dynamic Features
* Understand the basics of metaprogramming with method_missing, define_method, class_eval.
* Learn Ruby’s class hierarchy, singleton classes, and open classes to read library code.
* Dynamically generate or modify classes and methods as needed.
* Develop code in large codebases with flexible extensions and modifications.

### Level 8: Large-Scale Code Design & Advanced Standard Libraries
* Establish responsibility assignments and naming conventions for large Ruby projects, improving readability.
* Use advanced standard libraries (Socket, Open3, Net::HTTP, etc.) for networking or concurrency.
* Explore performance tuning (like GC behavior and Ractor) to pursue higher efficiency.
* Understand multi-threading and inter-process communication well enough to handle them safely.

### Level 9: Deep Understanding of Ruby Interpreters & Contributions
* Compare MRI and other interpreters (JRuby, TruffleRuby, etc.) to choose appropriately based on their features.
* Tackle core libraries and C extensions by reading and modifying Ruby’s internal implementation.
* Fluently use language features like Proc objects, Fibers, Enumerator::Lazy, and more.
* Lead large-scale refactoring efforts and safely modernize legacy codebases.

### Level 10: Ruby Expert & Involvement in Language Development
* Understand MRI’s source code well and have contributed to the core or standard libraries.
* Offer in-depth expertise in DSL construction, metaprogramming, performance optimization, and more.
* Participate in Ruby’s roadmap and community, influencing the evolution of the language.
* Provide insight into architectural design and multi-language comparisons, ensuring optimal use of Ruby.


## 1. Object
Since everything in Ruby is basically an object, many of the exercises revolve around class design.

### Insights from the exercises
* Using if and find for book management
* Using select for book searches
* Using super for generating payroll slips
## 2. Conditional Logic
### Insights from the exercises
* Using if for state management
* Using array operations (find, each, delete)
* Updating object states effectively
## 3. Repeat (Iteration)
### Insights from the exercises
* Using select for filtering
* Using map for value transformation
* Using sum and fdiv for average calculations
* Using sort for ordering
## 4. Module
I had a bit of a mental hurdle with modules, so I’ve practiced them more extensively than other areas.

### Insights from the exercises
* Declaring module functions with module and self.method_name
* Defining and accessing constants
* Including modules to utilize them as instance methods
* Nesting modules for namespace organization
* Extending objects with modules
* Adding custom methods to Array
* Dynamically extending modules with extend
* Using super for method chaining
## 5. Class
### Insights from the exercises
* Performing calculations using instance variables
* Managing bank accounts with class variables (@@)
* Employing class methods (self.method)
* Using find to search for products
* Updating inventory with if
* Displaying product lists with each
## 6. Operator
### Insights from the exercises
* Transforming list elements with map
* Implementing abs_diff for absolute differences
* Implementing even_or_odd for identifying parity
## 7. Error_Exception
### Insights from the exercises
* Reading files with File.open
* Counting lines with File.read
* Safely converting strings to Integer
* Avoiding zero division
* Implementing custom numeric checks via exceptions
* Raising an exception if arguments are missing
* Validating JSON data
## 8. Block
### Insights from the exercises
* Checking for block availability with block_given?
* Using sub and gsub in a block-based manner
* Summing values in an each loop, accumulating the results
* Obtaining adjacent elements with (0...(array.size - 1))
* Passing pairs to a block via yield(array[i], array[i + 1])
* Using .step(step) for iterating at certain intervals
* Sorting with .sort_by { |k, _| k } (by keys) and .sort_by { |_, v| v } (by values)
* Measuring execution time with Time.now
* Counting lines with File.foreach(filepath).count
* Tracking progress using .with_index
* Accepting multiple blocks with *blocks and chaining them with .call(result)
## 9. Numeric
### Insights from the exercises
* Summing array elements with .sum
* Calculating integer averages via .div(numbers.size)
* Getting the maximum and minimum with .max and .min
* Checking for '/' to distinguish Rational values
* Converting fraction strings to Rational(number)
* Converting decimal strings to Float using .to_f
* Creating complex numbers with Complex(a, b)
* Using .abs for the absolute value (distance) of a complex number
* Using .arg for the argument (angle) of a complex number
## 10. Array
### Insights from the exercises
* Using File.foreach to process files line by line without fully loading them into memory
* Using .gsub(/\\n/, \"\") to remove newlines
* Using .uniq.sort to remove duplicates and then sort
* Splitting text with .split('\\n') (noting single quotes might not behave as expected)
* Using loop do ... end for continuous user input
* Using gets.chomp to remove trailing newlines
* Using break if item.empty? to stop on an empty line
* Reading CSV rows via CSV.foreach(\"users.csv\", headers: true)
* Accessing columns by row[\"name\"] and row[\"age\"]
* Sorting by age with .sort_by { |u| u[:age] }
* Using .each (not .map) to modify the original array
* Using attr_accessor to make task status mutable
* Flattening nested arrays with .flatten and using .sort to arrange them
* Measuring time with Benchmark.bm and storing results in variables
## 11. String
### Insights from the exercises
* Using File.foreach(file_path) to handle lines efficiently
* Removing leading/trailing spaces with .strip
* Splitting on spaces or tabs with .split(/\\s+/)
* Ignoring empty lines via next if line.empty?
* Appending split data to an array with result << collums
* Using &:capitalize to capitalize the first letter of each word
* Checking if an ID starts with ID- using .start_with?(\"ID-\")
* Using .slice(start, length) to get the user part of the ID
* Matching only alphanumeric characters with /\\A[A-Za-z\\d]+\\z/
* Removing < and > using .delete('<>')
* Converting full-width spaces to half-width with .tr('　', ' ')
* Formatting decimal values with sprintf(\"%.2f\", price)
* Inserting commas every three digits using .gsub(/(\\d)(?=(\\d{3})+\\.)/, \"\\\\1,\")
## 12. Hash
### Insights from the exercises
* Checking for a key with .has_key?(key) (or .key?(key))
* Deleting a key with .delete(key) (which returns the deleted value)
* Using .each { |k, v| ... } to iterate over keys and values
* Summing only values with |_, sales| if the key isn’t needed
* Filtering by exact match with .select { |_, sales| sales == select_shop }
* Filtering by threshold with .select { |_, sales| sales > price }
## 13. Regexp
### Insights from the exercises
* Using .each_line for memory-efficient line-by-line processing
* Removing trailing newlines with .chomp
* Matching phone numbers with /\\A\\d{2,4}-\\d{3,4}-\\d{4}\\z/
* Extracting multiple instances of different formats with text.scan(pattern)
* Setting a default '00' if seconds aren’t provided (sec = sec || '00')
* Converting 12-hour to 24-hour time by adjusting hours if ampm.upcase == 'PM'
* Using format('%02d', hour_24) to zero-pad hours
* Using %r{...} to avoid escaping slashes in regex
* Matching https?:// for HTTP/HTTPS
* Matching [A-Za-z0-9.-]+ for domains
* Using (?:/[^\\s]*)? to optionally capture everything after the slash


# はじめに
このレポジトリは「たのしいRuby 第6版」で習った内容のアウトプットとして、ChatGPT o1を使用し問題を作成させ演習するというものです。
「たのしいRuby 第6版」はとてもわかりやすく、かなり網羅的に内容が載っている一方で、演習量が少なく表面的な理解にとどまっていたため、実際に手を動かして演習をすることで理解度を深めることができます。
問題内容や答えについてはAIに基づいたものなので必ずしも正確でない可能性がありますので、使用される際はご了承ください

# 環境
環境は以下の通りです
OS: windows 11
ruby 3.3.5 

# ディレクトリ構成
それぞれクラスや項目ごとにディレクトリが分かれています。
`first_try`ディレクトリは最初に問題を解いたディレクトリです。
`second_try`ディレクトリは復習のために問題を解いたディレクトリです
ファイルの名前は `難易度.rb`のようにしています。以下が難易度一覧です

### レベル1：環境構築・超入門
* Rubyのインストールや実行環境を整え、puts "Hello, World!" できる
* ruby filename.rb などの基本コマンドを理解
* 文法をほぼ知らなくても、ファイルを作って実行できる
### レベル2：基本文法の理解
* 変数・定数や文字列・数値・配列・ハッシュなどの基本的なデータ型を扱える
* if や while, each などの制御構文を使える
* メソッドを定義し、簡単な処理をまとめられる
* エラーメッセージを見て原因をおおまかに推測できる
### レベル3：クラス・モジュール・オブジェクト指向の基礎
* 自作クラスを定義し、インスタンス変数とメソッドを理解・活用できる
* 配列やハッシュのメソッド（map, select, find など）を使いこなせる
* モジュール(module)の仕組みを理解し、include などで再利用できる
* バックトレースを読んで簡単なデバッグが可能
### レベル4：複数ファイル・高度な文法を使った開発
* 複数のクラスやファイルにコードを分割し、用途別に整理できる
* 例外処理（begin-rescue）を使ってエラー時の動作を制御できる
* ブロックやプロック、yield などを理解し、柔軟な処理を組める
* コードの重複を減らすため、モジュールやメソッド分割などのリファクタリングを行える
### レベル5：標準ライブラリ・内部構造への理解
* Time, File, StringIO などの標準ライブラリを使いこなし、日常的な処理を効率化できる
* Enumerator, Enumerable などの仕組みを深く理解し、反復処理を高度に活用できる
* Rubyのオブジェクトモデルを把握し、self やスコープについて正確に説明できる
* 実行速度・メモリ使用量など、Rubyの内部構造を意識したコーディングができる
### レベル6：高度なエラー処理・デバッグ・性能改善
* raise, rescue, ensure, retry などを使い分け、複雑なエラー対応が可能
* traceback, debugger（byebug 等）を活用して効率的にバグを特定・修正できる
* プロファイラ（RubyProf, benchmark 標準ライブラリなど）を使って性能を測定し、ボトルネックを改善できる
* 文字コードや国際化（Encoding, I18n など）にも配慮できる
### レベル7：メタプログラミング・動的機能の活用
* method_missing, define_method, class_eval などを使ったメタプログラミングの基礎を理解
* Rubyのクラス階層・特異クラス・オープンクラスの仕組みを把握し、ライブラリのコードを読み解ける
* 動的にクラスやメソッドを生成・変更するテクニックを適切に使い分けられる
* 巨大なコードベースでも必要に応じて柔軟に拡張・修正できる
### レベル8：大規模コード設計・高度な標準ライブラリ利用
* 大きなRubyプロジェクトでの責務分割や命名規則などを設計し、可読性を高められる
* 高度な標準ライブラリ（Socket, Open3, Net::HTTP など）を使い、ネットワーク連携や並列処理を実装できる
* パフォーマンスチューニング（GCの挙動、Ractor など）を試し、より高い効率を追求できる
* マルチスレッドやプロセス間通信の仕組みを理解し、安全に扱える
### レベル9：Ruby処理系への深い理解・貢献
* MRIや他の処理系（JRuby, TruffleRubyなど）の特性を比較しながら使い分けられる
* コアライブラリやC拡張に踏み込み、Rubyの内部実装を読んだり修正できる
* 言語仕様の細部（Proc オブジェクトの扱い、Fibers, Enumerator::Lazy など）を自在に使える
* 大規模なリファクタリングをリードし、レガシーコードを安全にモダナイズできる
### レベル10：Rubyのエキスパート・言語開発への関与
* MRIのソースコードを理解し、コアや標準ライブラリへのコントリビュート経験がある
* DSL構築・メタプログラミング・性能最適化など、あらゆる面で高度な知見を提供できる
* Ruby本体のロードマップやコミュニティに深く関わり、言語仕様の発展にも寄与している
* 他言語との比較やアーキテクチャ設計にも通じ、Rubyを最適に活用する指針を示せる



## 1. Object
Rubyで登場するものは基本すべてオブジェクトなので、クラス設計による問題がメインとなりました
### 問題演習を通して得られたこと
* if と find を活用した書籍管理
* select を活用した書籍検索
* super を活用した給与明細の出力


## 2. Conditional Logic(条件分岐)
### 問題演習を通して得られたこと
* if文を活用した状態管理
* 配列の操作（find, each, delete）
* オブジェクトの状態更新

## 3. Repeat(繰り返し)
### 問題演習を通して得られたこと
* select を活用したフィルタリング
* map を活用した値の変換
* sum と fdiv を使った平均値計算
* sort を活用した並び替え


## 4. module
moduleはとても苦手意識があったので、ほかの分野よりも演習量が多いです
### 問題演習を通して得られたこと
* module と self.method_name によるモジュール関数
* 定数の定義とアクセス 
* モジュールを include してインスタンスメソッドとして使用
* モジュールを入れ子にして、名前空間を整理
* extend を使ってオブジェクトにメソッドを追加
* Array にカスタムメソッドを追加
* extend を活用し、動的にモジュールを適用
* super を活用したメソッドチェーン

## 5. class
### 問題演習を通して得られたこと
* インスタンス変数を活用した計算
* クラス変数 (@@) を活用した口座管理
* クラスメソッド (self.method) を活用
* find を活用した商品検索
* if を活用した在庫更新
* each を活用した商品リストの表示

## 6. operator(演算子)
### 問題演習を通して得られたこと
* map を活用したリストの要素変換
* abs_diff メソッドでの絶対値計算
* even_or_odd メソッド


## 7. Error_Exception(例外処理)
### 問題演習を通して得られたこと
* File.open を使ったファイルの読み込み
* File.read を使ったファイル行数のカウント
* 文字列を安全に Integer に変換
* ゼロ除算の回避
* 数値判定を行うカスタム例外
* 引数が空のときに raise で例外を発生
* JSON形式のバリデーション


## 8. block
### 問題演習を通して得られたこと
* block_given? を使い、ブロックが渡されたときのみ処理を実行
* sub や gsub を用いた 文字列置換の適用をブロックで制御
* each で繰り返し処理を行い、 ブロックの結果を total に加算
* (0...(array.size - 1)) を使い、隣り合う要素を取得
* yield(array[i], array[i + 1]) で ブロックにペアを渡して処理
* .step(step) を使い、 指定した間隔で要素を取得
* .sort_by { |k, _v| k } で キー順にソート
* .sort_by { |_k, v| v } で 値順にソート
* Time.now で開始・終了時刻を取得し 実行時間を測定
* .foreach(filepath).count で ファイルの行数を取得
* .with_index で 進捗計算しながら処理
* *blocks を使い、 可変長引数で複数のブロックを受け取る
* .call(result) で 各ブロックを連続適用

## 9. Numeric
### 問題演習を通して得られたこと
*  .sum を使い、 配列の要素を合計
* .div(numbers.size) を使い、 整数除算による平均値の計算
* .max と .min を使い、 最大値・最小値を取得
* .include?('/') を使い、 数値が分数（Rational）かどうかを判定
* Rational(number) を使い、 文字列の分数表記を Rational に変換
* *.to_f を使い、 小数の文字列を Float に変換
* Complex(a, b) を使い、 複素数 a + bi を作成
* .abs を使い、 複素数の絶対値（原点からの距離）を取得
* .arg を使い、 複素数の偏角（角度）を取得


## 10. Array
### 問題演習を通して得られたこと
* File.foreach を使うことで ファイルをメモリに一括読み込みせず、1行ずつ処理可能
* .gsub(/\n/, "") を使い、 改行を削除
* .uniq.sort を使い、 重複を排除しつつソート
* .split('\n') を使い、 改行で分割（ただし '\n' はシングルクオートだと意図した動作をしないので注意）
* loop do ... end を使い、 ユーザー入力を継続的に受け取る
* gets.chomp を使い、 ユーザーの改行を削除
* break if item.empty? で 空行が入力されたら終了
* CSV.foreach("users.csv", headers: true) を使い、 CSVファイルを1行ずつ処理
* row["name"], row["age"] を使い、 カラム名を指定して値を取得
* .sort_by { |u| u[:age] } で 年齢順にソート
* .map ではなく .each を使い 元のオブジェクトを変更（map だと新しい配列を作るので不要）
* attr_accessor を使い、 タスクの状態を変更可能に
* .flatten を使い、 二次元配列を一次元に展開
* .sort を使い、 アルファベット順に並べ替え
* Benchmark.bm を使い、 処理ごとの実行時間を計測
* .report("処理名") を使い、 どの処理にどの程度の時間がかかるか測定
* 変数 map_result, reject_result に保存し、 計測後もデータを保持


## 11. String
### 問題演習を通して得られたこと
* File.foreach(file_path) を使い、 行ごとに処理（メモリ節約）
* .strip を使い、 前後の空白を削除
* .split(/\s+/) を使い、 スペースやタブで単語を分割
* next if line.empty? で 空行をスキップ
* result << collums で 分割したデータを配列に追加
* &:capitalize を使い、 各単語の最初の文字を大文字に変換
* .map(&:capitalize) は .map { |word| word.capitalize } の省略形
* .start_with?("ID-") を使い、 IDのフォーマットチェック
* .slice(start, length) を使い、 IDのユーザー部分を取得
* /\A[A-Za-z\d]+\z/ を使い、 英数字のみ許可する正規表現
* user_part.size > 10 で 長さ制限をチェック
* .delete('<>') を使い、 HTMLタグに使われる < > を削除
* .tr('　', ' ') を使い、 全角スペースを半角スペースに変換
* sprintf("%.2f", price) を使い、 小数点以下2桁にフォーマット
* .gsub(/(\d)(?=(\d{3})+\.)/, "\\1,") を使い、 3桁ごとにカンマを挿入

## 12. hash
### 問題演習を通して得られたこと
* .has_key?(key) を使い、 指定したキーが存在するかを確認（key? でも同じ動作）
* .delete(key) を使い、 指定したキーとその値を削除
* 削除された値が戻り値として返る 
* .each を使い、 キーと値を同時に取得して処理
* ループ内で "ID:1 Name:Takeshi" のように表示
* |_, sales| で キーを無視し、売上 (sales) のみ処理
* .select { |_, sales| sales == select_shop } を使い、 特定の売上の店舗を抽出
* .select { |_, sales| sales > price } を使い、 売上が閾値以上の店舗を取得

## 13. Regexp
### 問題演習を通して得られたこと
.each_line を使い、 1行ずつ処理してメモリ効率を上げる
* .chomp を使い、 末尾の改行を削除
* \A \z を使い、 完全一致の電話番号を検出
* \d{2,4}-\d{3,4}-\d{4} を使い、 2桁～4桁-3桁～4桁-4桁のパターンをマッチ
* text.scan(pattern) を使い、 異なるフォーマットの日付をそれぞれ抽出
* sec = sec || '00' を使い、 秒の値がない場合はデフォルトで '00' を設定
* hour_24 = h.to_i + 12 if ampm.upcase == 'PM' && hour_24 < 12 を使い、 AM/PM を24時間制に変換
* format('%02d', hour_24) を使い、 2桁のゼロ埋めを適用
* %r{...} を使い、 スラッシュ (/) をエスケープせずに扱えるようにする
* https?:// を使い、 http または https の URL を検出
* [A-Za-z0-9.-]+ を使い、 ドメイン名を検出
* (?:/[^\s]*)? を使い、 スラッシュ以降の部分をオプションで含める
