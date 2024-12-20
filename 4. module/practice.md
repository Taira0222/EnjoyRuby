# 問題1（難易度：レベル7）
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
pipeline.extend(FilterModule)
pipeline.extend(TransformModule)
pipeline.extend(AggregateModule)

p pipeline.process
# => [50]
```

# 問題2（難易度：レベル8）
## 概要
プラグインアーキテクチャを持つログ処理システムを作成します。
LoggerBaseクラスはログメッセージを受け取り、登録されたモジュール（プラグイン）を通して、ログを整形・フィルタ・出力します。

## 要件
1. LoggerBaseクラス：
    * logメソッドで文字列メッセージを受け取る。
    * 登録されたプラグインモジュールがlogをフックし、メッセージを変換、フィルタリングまたは別処理を行う。
    * 全てのプラグインを通過後、最終的なメッセージを出力。
2. プラグインモジュール例：
    * TimestampPlugin：logメソッドをフックして、メッセージの先頭に現在時刻を付ける。
    * LevelPlugin：logメソッドをフックして、WARN以上のレベルの場合のみメッセージを出力し、それ未満はフィルタリング。
    * UppercasePlugin：logメソッドをフックして、メッセージを大文字に変換。
3. 使用方法：
    * logger = LoggerBase.new
    * 必要なプラグインをprependでモジュールを挿入し、logメソッド呼び出し時に順次変換・フィルタを行う。
    * 全てのプラグインを通じて最後にLoggerBase本体のlogが呼ばれ、最終出力が行われる。
4. 実行例：
    * UppercasePluginとTimestampPluginを使い、logger.log("test message")を呼ぶと、"2023-08-20 12:00:00 TEST MESSAGE" のような出力になる。
    * LevelPluginを先頭にprependして、WARN未満のログは出力されないようにする。

## 出力例
```ruby
# プラグインを好みの順序でprependする
logger = LoggerBase.new
logger.singleton_class.prepend(TimestampPlugin)
logger.singleton_class.prepend(UppercasePlugin)
logger.singleton_class.prepend(LevelPlugin)

logger.log("this is info", :info)   # infoは出力されない（levelpluginでフィルタ）
logger.log("warning occurred!", :warn)
# => "2023-08-20 12:00:00 WARNING OCCURRED!"
```