# レベル7: 動的プロキシクラスの作成

## 1. モジュールを使わないシンプルな実装例
```ruby
class LoggerProxy
  def initialize(target)
    @target = target
  end

  def method_missing(method_name, *args, &block)
    # 委譲先がこのメソッドを実装しているか確認
    if @target.respond_to?(method_name)
      # ログ出力
      puts "Calling: #{method_name}(#{args.map(&:inspect).join(', ')})"

      # 実際のオブジェクトに処理を委譲
      @target.send(method_name, *args, &block)
    else
      # 委譲先が実装していないメソッドの場合は NoMethodError
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    # 委譲先が応答可能かどうかを返す
    @target.respond_to?(method_name, include_private) || super
  end
end
```
## 使い方の例
```ruby
hash = { a: 1, b: 2 }
proxy = LoggerProxy.new(hash)

p proxy.keys
# => Calling: keys()
# => [:a, :b]

p proxy[:a]
# => Calling: [](:a)
# => 1

proxy[:c] = 3
# => Calling: []=(:c, 3)

p proxy.fetch(:c)
# => Calling: fetch(:c)
# => 3

proxy.non_existing_method
# => Calling: non_existing_method()
# => NoMethodError (hashには定義されていない)
```
## 2. モジュールを活用した実装例
ログ出力のロジックをモジュールに分割し、LoggerProxy クラス側ではロジックを呼び出す形にすることで、将来的に別の出力方法（ファイル出力やリモートログ出力など）に切り替えたい場合でも対応しやすくできます。

ログ出力用モジュールの例
```ruby
module LoggingModule
  def log_method_call(method_name, args)
    puts "Calling: #{method_name}(#{args.map(&:inspect).join(', ')})"
  end
end
```
LoggerProxy クラスの例
```ruby
class LoggerProxy
  include LoggingModule

  def initialize(target)
    @target = target
  end

  def method_missing(method_name, *args, &block)
    if @target.respond_to?(method_name)
      # ログ出力をモジュールに切り出した例
      log_method_call(method_name, args)

      # 実際のオブジェクトに処理を委譲
      @target.public_send(method_name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    @target.respond_to?(method_name, include_private) || super
  end
end
```
## 使い方の例
```ruby
hash = { a: 1, b: 2 }
proxy = LoggerProxy.new(hash)

p proxy.keys
# => Calling: keys()
# => [:a, :b]

p proxy[:a]
# => Calling: [](:a)
# => 1

proxy[:c] = 3
# => Calling: []=(:c, 3)

p proxy.fetch(:c)
# => Calling: fetch(:c)
# => 3

proxy.non_existing_method
# => Calling: non_existing_method()
# => NoMethodError
```
## 実装のポイント
### ログ出力

method_missing 内で呼び出されたメソッド名と引数を出力しています。
args.map(&:inspect).join(', ') で引数を見やすい文字列に整形しています。
### 委譲先オブジェクトとの連携

@target.respond_to?(method_name) で委譲先が対応可能かどうかを確認しています。
メソッド呼び出しの委譲は、@target.send(method_name, *args, &block) や public_send を使うことで実現できます。
### respond_to_missing? の実装

respond_to? が呼び出されたとき、@target が応答できるかどうかに応じて true / false を返すようにしています。
super を呼び出しているのは、LoggerProxy 自身が独自に持つ（または Object が持つ）メソッドの場合の応答を担保するためです。
### モジュール化

ログを出力する機能を LoggingModule のように切り出すことで、他の出力先への変更があっても LoggerProxy 本体を最小限の修正で済ませられるようになります。
もちろん単一クラス内にまとめても問題ありません。
