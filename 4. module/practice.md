## レベル1（基礎的な理解）
### 問題1:
新しいモジュールGreetingsを定義し、その中にメソッドhelloを作成して「Hello, World!」と出力するコードを書きなさい。

### 問題2:
以下のコードに不足している部分を補い、モジュールMathOperationsをクラスCalculatorにミックスインしてaddメソッドを使用できるようにしなさい。

```ruby
module MathOperations
  def add(a, b)
    a + b
  end
end

class Calculator
  # ここにミックスインのコードを追加
end

calc = Calculator.new
puts calc.add(5, 3)  # 出力: 8
```
## レベル2（モジュールの定数とメソッド）
### 問題1:
モジュールConstantsを定義し、その中に円周率を表す定数PIを3.14159として定義しなさい。また、PIを出力するコードを書きなさい。

### 問題2:
以下のモジュールUtilitiesにクラスメソッドgreetを追加し、「こんにちは！」と出力するようにしなさい。

```ruby
module Utilities
  # クラスメソッドgreetを定義
end

Utilities.greet  # 出力: こんにちは！
```
## レベル3（ミックスインとインスタンスメソッド）
### 問題1:
モジュールFlyableを定義し、その中にインスタンスメソッドflyを作成して「飛んでいます！」と出力するコードを書きなさい。その後、クラスBirdにこのモジュールをミックスインし、flyメソッドを呼び出しなさい。

### 問題2:
以下のモジュールSwimmableを定義し、swimメソッドを追加しなさい。そして、クラスFishにこのモジュールをミックスインして、swimメソッドを使用できるようにしなさい。

```ruby
module Swimmable
  # swimメソッドを定義
end

class Fish
  # ミックスインのコードを追加
end

nemo = Fish.new
nemo.swim  # 出力: （適切なメッセージ）
```
## レベル4（ネストしたモジュールと名前空間）
### 問題1:
モジュールAnimalsの中にモジュールMammalsをネストし、その中にクラスDogを定義して、メソッドspeakが「ワンワン」と出力するようにしなさい。Dogクラスのインスタンスを作成し、speakメソッドを呼び出しなさい。

### 問題2:
以下の名前空間を使用して、モジュールVehicles::Land内にクラスCarを定義し、driveメソッドで「運転しています」と出力するコードを書きなさい。その後、Carクラスのインスタンスを作成してdriveメソッドを呼び出しなさい。

```ruby
module Vehicles
  module Land
    # クラスCarを定義
  end
end

car = Vehicles::Land::Car.new
car.drive  # 出力: 運転しています
```
## レベル5（高度なモジュール使用法）
### 問題1:
モジュールSingletonLoggerを作成し、シングルトンパターンを利用してログメッセージを記録するメソッドlogを定義しなさい。logメソッドは受け取ったメッセージをコンソールに出力します。SingletonLoggerを使用して「アプリケーションが開始されました」というメッセージをログに記録しなさい。

### 問題2:
モジュールEnumerableExtensionsを定義し、Arrayクラスにミックスインして新しいメソッドsecondを追加しなさい。secondメソッドは配列の2番目の要素を返します。以下のコードが正しく動作するように実装しなさい。


```ruby
module EnumerableExtensions
  # secondメソッドを定義
end

class Array
  include EnumerableExtensions
end

arr = [10, 20, 30, 40]
puts arr.second  # 出力: 20
```
## レベル7
## 概要
あなたは、データ処理パイプラインを構築するシステムを作成します。
入力となる配列データに対し、複数の処理ステップ（フィルタリング、変換、集計など）をモジュールとして定義し、パイプラインクラスに動的にミックスインすることで、処理内容をカスタマイズできる仕組みを作ってください。

## 要件
1. DataPipelineクラス：
    * @dataインスタンス変数に配列データを保持します。
    * processメソッドを呼び出すと、ミックスインされたモジュールが順番にデータを処理し、最終結果を返す。
    * ミックスインするモジュールは任意の数だけ追加可能で、追加した順序で処理を適用。
2. モジュールの例：
    * FilterModule：@dataから特定条件で要素を除外する
    * TransformModule：@dataの各要素に対して特定の変換を施す（例: 全てに+10）
    * AggregateModule：最後に@dataの合計や平均などの集計結果を返す代わりに、@dataを集計後の1要素に置き換える
3. 実行例：
    * FilterModuleをincludeして10以上の要素のみ残す
    * TransformModuleをincludeして残った要素に+5する
    * AggregateModuleをincludeして最終的に平均値を1要素の配列にする
    * DataPipelineインスタンスに [3,12,49,10,55,7,100] を渡し、processを実行すると、
        * 第1ステップ(フィルタ): [12,49,10,55,100]
        * 第2ステップ(変換): [17,54,15,60,105]
        * 第3ステップ(集計): すべての要素の平均（(17+54+15+60+105)=251/5=50.2切り捨て50）を [50] として返す
    * 最終出力: [50]
## 出力例
```ruby
# パイプラインにモジュールをミックスインする
pipeline = DataPipeline.new([3,12,49,10,55,7,100])
# 順番にincludeすることで処理順を決定
pipeline.extend(AggregateModule)
pipeline.extend(TransformModule)
pipeline.extend(FilterModule)

p pipeline.process
# => [50]
```

