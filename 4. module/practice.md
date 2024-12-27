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
pipeline.extend(AggregateModule)
pipeline.extend(TransformModule)
pipeline.extend(FilterModule)

p pipeline.process
# => [50]
```

# 問題2（難易度：レベル8）
## 概要
Ruby で、プラグインアーキテクチャを持つログ処理システムを作成してください。
中心となる LoggerBase クラスがあり、そのクラスの log メソッドを呼び出すと、あらかじめ登録（prepend）された複数のモジュール（プラグイン）がフックしてログメッセージを変換・フィルタリングなどを施し、最後に LoggerBase 本体が最終的なログ出力を行います。

## 要件
1. LoggerBaseクラス：
    * log(message, level = :info) メソッドを持つ（引数はメッセージとログレベル）。
    * 登録されたプラグインモジュールがフックし、メッセージを変換・フィルタリングまたは別の処理を行う。
    * 最終的に（プラグインをすべて通過した後で）LoggerBase が標準出力などにログを出力する。
2. ログレベル
    * ログレベルとして以下のシンボルを定義する: :debug, :info, :warn, :error, :fatal
    * それぞれの優先度（低→高）は次の通りとする: :debug < :info < :warn < :error < :fatal
    * LevelPlugin など、ログレベルに関連するプラグインを作成するときは、この優先度にしたがってフィルタリング・処理を行う。
3. プラグインモジュール
    * それぞれのプラグインは log メソッドを定義し、super を使って次のモジュール（または LoggerBase）へ処理を渡す。
    * 以下の例を最低限用意する。必要に応じて追加・変更してもよい。
        1. TimestampPlugin
            * log(message, level) をフックして、メッセージの先頭に現在時刻（フォーマットは "YYYY-MM-DD HH:MM:SS" などでOK）を付与する。
            * super("#{timestamp} #{message}", level) のように呼び出して、次へ処理を渡す。
        2. UppercasePlugin
            * log(message, level) をフックして、受け取ったメッセージを大文字に変換してから次へ処理を渡す。
        3. LevelPlugin
            * log(message, level) をフックして、設定された最小ログレベル threshold 未満のログは出力しないようにフィルタリングする。
            * たとえば threshold が :warn であれば、:warn, :error, :fatal のときだけ次へ処理を渡し、:info, :debug は破棄（何も出力せず終了）する。
            * threshold 値はモジュール内の定数やクラス変数などで保持してもよいし、prepend 時に引数で注入してもよい。
4. 使用例・実行例
    * 下記のように LoggerBase のインスタンスを生成し、順次 prepend していく。
    ```ruby
        logger = LoggerBase.new

        # prependする順序を変えると処理順も変化する
        logger.singleton_class.prepend(TimestampPlugin)
        logger.singleton_class.prepend(UppercasePlugin)
        logger.singleton_class.prepend(LevelPlugin)

        # このレベルは :warn 未満なので出力されない
        logger.log("this is info", :info)

        # こちらは threshold(:warn) 以上なのでフィルタを通過し、すべてのプラグインを通る
        logger.log("warning occurred!", :warn)
        logger.log("serious error!", :error)

        # 出力結果
        2024-12-26 12:00:00 WARNING OCCURRED!
        2024-12-26 12:00:00 SERIOUS ERROR!
    ```
    * logger.log("this is debug", :debug)
        * LevelPlugin が threshold :warn ならフィルタされ、出力されない

    * logger.log("some warning!", :warn)
        * LevelPlugin が threshold :warn ならフィルタを通過し
        * UppercasePlugin で大文字化され "SOME WARNING!" に
        * TimestampPlugin で "2024-12-26 12:00:00 SOME WARNING!" のような文字列になり、最終的に LoggerBase.log で出力される

