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


