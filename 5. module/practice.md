# 問題1: 複数種類の通知システム
## 概要
異なる種類の通知を管理するシステムを作成してください。ユーザーには通知を送信でき、通知の種類（メール、SMS、プッシュ通知）ごとに異なる内容を送信する機能を実装します。

## 要件
1. Notification クラス:
    * 通知の内容（message）と送信先（recipient）を管理。
    * 送信メソッドを持つ。
商品の削除ができる。
2. EmailNotification クラス:
    * Notification クラスを継承し、メール通知の送信メソッドをオーバーライド。
3. SMSNotification クラス:
    * Notification クラスを継承し、SMS通知の送信メソッドをオーバーライド。
4. PushNotification クラス:
    * Notification クラスを継承し、プッシュ通知の送信メソッドをオーバーライド。
5. NotificationSender モジュール:
    * 通知を送信するメソッドを提供。

## 出力例
```ruby
# 実行例
email = EmailNotification.new("user@example.com", "新しいメッセージが届きました")
sms = SMSNotification.new("080-1234-5678", "新しいメッセージが届きました")
push = PushNotification.new("user123", "新しいメッセージが届きました")

NotificationSender.send_notification(email)
NotificationSender.send_notification(sms)
NotificationSender.send_notification(push)
```

# 問題2: イベントスケジュール管理システム
## 概要
複数のイベントを管理するシステムを作成してください。イベントは日程、場所、参加者を管理し、各イベントごとに異なる参加者を追加したり、削除したりできるようにします。

## 要件
1. Event クラス:
    * イベントの日程（date）、場所（location）、参加者（participants）を管理。
    * 参加者の追加・削除機能。
    * イベントの詳細（名前、日程、場所）を表示する機能。
2. EventManager クラス:

    * 複数のイベントを管理。
    * イベントの追加・削除。
    * すべてのイベントを一覧表示する機能。
3. Participant クラス:

    * 参加者の名前と連絡先を管理。
4. EventDisplay モジュール:

    * イベントの詳細情報を表示するためのモジュール。

## 出力例
```ruby
# 実行例
participant1 = Participant.new("山田太郎", "yamada@example.com")
participant2 = Participant.new("佐藤花子", "sato@example.com")

event1 = Event.new("Rubyカンファレンス", "2024-10-10", "東京")
event2 = Event.new("Rails勉強会", "2024-10-12", "大阪")

event1.add_participant(participant1)
event2.add_participant(participant2)

manager = EventManager.new
manager.add_event(event1)
manager.add_event(event2)

manager.list_events
```