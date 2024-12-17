問1 答え
```ruby
# 通知を送信するモジュール
module NotificationSender
  # 通知を送信するメソッド
  # 引数として通知オブジェクトを受け取り、そのsendメソッドを呼び出す
  def self.send_notification(notification)
    notification.send  # sendメソッドは通知オブジェクトごとに実装されている
  end
end

# 通知の基本クラス
class Notification
  attr_reader :recipient, :message   # 受信者とメッセージを読み取るためのアクセサ

  # 初期化メソッド（受信者とメッセージを設定）
  def initialize(recipient, message)
    @recipient = recipient
    @message = message
  end

  # 通知送信の抽象メソッド（サブクラスで実装が必要）
  def send
    raise "sendメソッドはサブクラスで実装する必要があります"  # サブクラスで必ず実装することを要求
  end
end

# メール通知クラス（Notificationクラスを継承）
class EmailNotification < Notification
  # メール送信を実行するメソッド
  def send
    puts "メールを送信しました: #{message} (受信者: #{recipient})"  # メールの送信メッセージを表示
  end
end

# SMS通知クラス（Notificationクラスを継承）
class SMSNotification < Notification
  # SMS送信を実行するメソッド
  def send
    puts "SMSを送信しました: #{message} (受信者: #{recipient})"  # SMSの送信メッセージを表示
  end
end

# プッシュ通知クラス（Notificationクラスを継承）
class PushNotification < Notification
  # プッシュ通知を実行するメソッド
  def send
    puts "プッシュ通知を送信しました: #{message} (受信者: #{recipient})"  # プッシュ通知の送信メッセージを表示
  end
end

# 実行例
email = EmailNotification.new("user@example.com", "新しいメッセージが届きました")  # メール通知のインスタンスを作成
sms = SMSNotification.new("080-1234-5678", "新しいメッセージが届きました")  # SMS通知のインスタンスを作成
push = PushNotification.new("user123", "新しいメッセージが届きました")  # プッシュ通知のインスタンスを作成

# 各通知の送信
NotificationSender.send_notification(email)  # メール通知を送信
NotificationSender.send_notification(sms)   # SMS通知を送信
NotificationSender.send_notification(push)  # プッシュ通知を送信


```

# 問2 回答
```ruby
# イベント表示モジュール
module EventDisplay
  # イベントの詳細を表示するメソッド
  def self.display_event(event)
    puts "イベント名: #{event.name}"
    puts "日程: #{event.date}"
    puts "場所: #{event.location}"
    puts "参加者:"
    event.participants.each { |participant| puts "名前: #{participant.name}, 連絡先: #{participant.contact}" }
  end
end

# 参加者クラス
class Participant
  attr_reader :name, :contact  # 名前と連絡先を読み取るためのアクセサ

  # 初期化メソッド（名前と連絡先を設定）
  def initialize(name, contact)
    @name = name
    @contact = contact
  end
end

# イベントクラス
class Event
  attr_reader :name, :date, :location  # イベント名、日程、場所を読み取るためのアクセサ
  attr_accessor :participants  # 参加者を管理するためのアクセサ

  # 初期化メソッド（イベント名、日程、場所を設定、参加者は空で初期化）
  def initialize(name, date, location)
    @name = name
    @date = date
    @location = location
    @participants = []
  end

  # 参加者を追加するメソッド
  def add_participant(participant)
    @participants << participant  # 参加者を参加者リストに追加
  end

  # 参加者を削除するメソッド
  def remove_participant(participant)
    @participants.delete(participant)  # 参加者を参加者リストから削除
  end
end

# イベントマネージャークラス
class EventManager
  attr_reader :events  # 管理するイベントリストを読み取るためのアクセサ

  # 初期化メソッド（イベントリストを空で初期化）
  def initialize
    @events = []
  end

  # 新しいイベントを管理リストに追加するメソッド
  def add_event(event)
    @events << event
  end

  # 管理リストからイベントを削除するメソッド
  def remove_event(event)
    @events.delete(event)
  end

  # すべてのイベントを一覧表示するメソッド
  def list_events
    @events.each { |event| EventDisplay.display_event(event) }  # 各イベントの詳細を表示
  end
end

# 実行例
participant1 = Participant.new("山田太郎", "yamada@example.com")  # 参加者1を作成
participant2 = Participant.new("佐藤花子", "sato@example.com")  # 参加者2を作成

event1 = Event.new("Rubyカンファレンス", "2024-10-10", "東京")  # イベント1を作成
event2 = Event.new("Rails勉強会", "2024-10-12", "大阪")  # イベント2を作成

event1.add_participant(participant1)  # イベント1に参加者1を追加
event2.add_participant(participant2)  # イベント2に参加者2を追加

manager = EventManager.new  # イベントマネージャーを作成
manager.add_event(event1)  # イベント1を管理リストに追加
manager.add_event(event2)  # イベント2を管理リストに追加

manager.list_events  # すべてのイベントを表示

```