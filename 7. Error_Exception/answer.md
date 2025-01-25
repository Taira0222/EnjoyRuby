# レベル4_1の解答
```ruby
def read_file_contents(file_path)
  begin
    # ファイルオープンと読み込み
    content = File.read(file_path)
    puts "ファイルの内容: #{content}"
    return content
  rescue Errno::ENOENT
    # ファイルが存在しなかった場合
    puts "ファイルが見つかりませんでした"
    return nil
  end
end

# 実行例
read_file_contents("test.txt")
```

# レベル4_2の解答
```ruby
def to_int_safely(str)
  begin
    Integer(str)
  rescue ArgumentError
    nil
  end
end

# 実行例
p to_int_safely("123")   # => 123
p to_int_safely("abc")   # => nil
p to_int_safely("12.3")  # => nil (小数も変換できないので例外が発生)

```

# レベル4_3の解答
```ruby
def write_to_file(file_path, content)
  begin
    File.open(file_path, "w") do |f|
      f.puts(content)
    end
    puts "ファイルに書き込みました: #{file_path}"
  rescue Errno::EISDIR
    puts "書き込みできませんでした(ディレクトリを指定していませんか？): #{file_path}"
  rescue StandardError => e
    # 他のエラーがあればまとめて捕捉
    puts "ファイル書き込み時にエラーが発生しました: #{e.message}"
  end
end

# 実行例
write_to_file("test.txt", "Hello, world!")      # 正常に書き込めるはず
write_to_file(".", "This is a directory...")   # ディレクトリ名を指定

```
# レベル4_4の解答
```ruby
def split_bill(amount, number_of_people)
  begin
    per_person = amount / number_of_people
    per_person
  rescue ZeroDivisionError
    puts "人数が0です"
    nil
  rescue StandardError => e
    puts "エラーが発生しました: #{e.message}"
    nil
  end
end

# 実行例
p split_bill(1000, 4)  # => 250
p split_bill(1000, 0)  # => nil (「人数が0です」を表示)

```
# レベル4_5の解答
```ruby
def count_file_lines(file_path)
  begin
    content = File.read(file_path)
    return content.lines.count
  rescue Errno::ENOENT
    puts "ファイルが存在しません: #{file_path}"
    -1
  rescue StandardError => e
    puts "読み込み時にエラーが発生しました: #{e.message}"
    -1
  end
end

# 実行例
p count_file_lines("sample.txt")    # 存在すれば行数を返す
p count_file_lines("not_exist.txt") # => -1 (「ファイルが存在しません」と表示)

```

# レベル5_1の解答例
```ruby
def safe_read_file(file_path)
  # 1. 引数チェック
  if file_path.empty?
    raise ArgumentError, "ファイルパスが空です"
  end

  # 2. ファイル読み込み
  begin
    content = File.read(file_path)
    return content
  rescue Errno::ENOENT => e
    puts "ファイルが存在しません: #{file_path}"
    # エラーメッセージをログ出力するなど
    # 同じ例外を再スロー
    raise e
  end
end

# 実行例
begin
  data = safe_read_file("")
rescue ArgumentError => e
  puts "引数エラー: #{e.message}"
end

begin
  data = safe_read_file("non_existent_file.txt")
rescue Errno::ENOENT => e
  puts "再スロー捕捉: #{e.message}"
end
```

# レベル5_2の解答例
```ruby
#####################################
# カスタム例外クラス定義
#####################################
class InvalidParamError < StandardError; end

#####################################
# メソッド定義
#####################################
def calculate_square(value)
  unless value.is_a?(Numeric)
    raise InvalidParamError, "数値ではありません: #{value.inspect}"
  end
  value**2
end

# 呼び出し例（書き直し）

# 正常な呼び出し
result1 = calculate_square(5)
puts result1  # => 25

# 例外発生を個別に処理する
begin
  result2 = calculate_square("hello")
  puts result2
rescue InvalidParamError => e
  puts "パラメータエラーが発生: #{e.message}"
end
```
# レベル5_3の解答例
```ruby
def open_user_account(username, age)
  # バリデーション
  raise ArgumentError, "ユーザー名が空です" if username.empty?
  raise ArgumentError, "年齢は0以上である必要があります" if age < 0

  begin
    File.open("users.txt", "a") do |f|
      f.puts("#{username}, #{age}")
    end
    puts "ユーザーアカウントを作成しました: #{username}, #{age}"
  rescue StandardError => e
    # エラーをログに出力
    puts "ファイル書き込み時にエラーが発生: #{e.message}"
    # 同じ例外を再スロー
    raise
  end
end


# 呼び出し例（書き直し）
# 正常な呼び出し
begin
  open_user_account("alice", 20)
rescue ArgumentError => e
  puts "引数エラー: #{e.message}"
rescue => e
  puts "その他のエラー: #{e.message}"
end

# ユーザー名が空のケース
begin
  open_user_account("", 30)
rescue ArgumentError => e
  puts "引数エラー: #{e.message}"
rescue => e
  puts "その他のエラー: #{e.message}"
end

# ageが負のケース
begin
  open_user_account("bob", -5)
rescue ArgumentError => e
  puts "引数エラー: #{e.message}"
rescue => e
  puts "その他のエラー: #{e.message}"
end
```
# レベル5_4の解答例
```ruby

require 'json'

class JsonDataError < StandardError; end

def parse_json_data(json_str)
  raise ArgumentError, "JSON文字列が空です" if json_str.empty?

  begin
    JSON.parse(json_str)
  rescue JSON::ParserError => e
    raise JsonDataError, "JSONパースに失敗しました: #{e.message}"
  end
end

# 呼び出し例（書き直し）

# 正常なJSON文字列
begin
  result = parse_json_data('{"name": "Bob", "age": 25}')
  p result  # => {"name"=>"Bob", "age"=>25}
rescue ArgumentError => e
  puts "引数エラー: #{e.message}"
rescue JsonDataError => e
  puts "JSONデータエラー: #{e.message}"
end

# 空文字列
begin
  parse_json_data("")  # => ArgumentError
rescue ArgumentError => e
  puts "引数エラー: #{e.message}"
rescue JsonDataError => e
  puts "JSONデータエラー: #{e.message}"
end

# 不正なJSON
begin
  parse_json_data('{name: "Bob", age: 25}')  # => JSON::ParserError -> JsonDataError
rescue ArgumentError => e
  puts "引数エラー: #{e.message}"
rescue JsonDataError => e
  puts "JSONデータエラー: #{e.message}"
end
```

# レベル5_5の解答例
```ruby
# ダミーで外部API呼び出しを模擬
def fetch_data_from_api
  raise "API Error!" if rand < 0.5  # 50%の確率でエラー
  "APIから取得したデータ"
end

def fetch_data_with_retry
  max_retries = 3
  attempts = 0

  begin
    attempts += 1
    return fetch_data_from_api
  rescue StandardError => e
    puts "リトライ中... (#{attempts}回目): #{e.message}"
    if attempts < max_retries
      sleep(1)  # オプションで待機
      retry
    else
      # 3回失敗したら再スロー
      raise e
    end
  end
end

# 呼び出し例（書き直し）

# 呼び出し1 (リトライに成功するかも)
begin
  data1 = fetch_data_with_retry
  puts "成功1: #{data1}"
rescue => e
  puts "3回失敗。最終的にエラー: #{e.message}"
end

# 呼び出し2 (状況によっては失敗する)
begin
  data2 = fetch_data_with_retry
  puts "成功2: #{data2}"
rescue => e
  puts "3回失敗。最終的にエラー: #{e.message}"
end
```


# レベル6の解答例
```ruby
require 'json'

def load_json_file(file_path)
  data = nil
  begin
    file_content = File.read(file_path)
    data = JSON.parse(file_content)
  rescue Errno::ENOENT
    puts "ファイルが存在しません: #{file_path}"
    data = nil
  rescue JSON::ParserError => e
    puts "JSONのパースに失敗しました: #{e.message}"
    data = nil
  ensure
    # 例外があってもなくても必ず実行
    puts "ファイル読み込み処理終了"
  end
  data
end

# 実行例
result = load_json_file("data.json")
if result.nil?
  puts "データを取得できませんでした"
else
  puts "読み込んだデータ: #{result.inspect}"
end
```

# レベル7の解答例
```ruby 
########################
# カスタム例外クラス
########################
class DatabaseError < StandardError; end
class ServiceError < StandardError; end

########################
# リポジトリ層 (DBアクセス)
########################
module Repository
  def self.fetch_user_from_db(user_id)
    # 何らかのDB操作
    begin
      # 仮のコード: DB操作で例外が発生するかもしれない
      raise StandardError, "DB接続が失敗しました"  # ダミー例外

      # 実際には DBクエリ等を実行し、結果を返す
      # return user_record
    rescue StandardError => e
      # 受け取った例外をDatabaseErrorでラップしてスロー
      raise DatabaseError, "データベースエラーが発生: #{e.message}"
    end
  end
end

########################
# サービス層
########################
module UserService
  def self.get_user_info(user_id)
    begin
      user_record = Repository.fetch_user_from_db(user_id)
      # ビジネスロジックやバリデーションなどが入る
      return user_record
    rescue DatabaseError => e
      # DB関連の例外をキャッチし、ログ出力
      puts "[ERROR][UserService] DBエラー: #{e.message}"
      # 必要に応じて別の例外に変換して再スロー
      raise ServiceError, "ユーザー情報の取得に失敗しました"
    end
  end
end

########################
# コントローラ層 (例: Sinatra などを想定)
########################
class UsersController
  def show(user_id)
    begin
      user_info = UserService.get_user_info(user_id)
      # 取得した情報をJSONなどの形式で返す
      return { status: 200, data: user_info }
    rescue ServiceError => e
      # 業務ロジック関連のエラー
      return { status: 404, error: e.message }
    rescue => e
      # 予期しないエラーの場合 (RuntimeError 等含む)
      puts "[FATAL][UsersController] 想定外のエラー: #{e.class} - #{e.message}"
      return { status: 500, error: "予期しないエラーが発生しました" }
    end
  end
end

########################
# 実行例
########################
controller = UsersController.new
response = controller.show(1)
puts response.inspect
```