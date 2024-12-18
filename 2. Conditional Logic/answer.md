# 問1 答え
※コメントよりコードに異常があるため、12/17に確認する
```ruby
class Task
    attr_accessor :name, :assignee, :status

    def initialize(name,assignee)
        @name = name
        @assignee = assignee
        @status = "未着手" # 新しいタスクはすべて未着手
    end
end
class TeamMember
    attr_accessor :name, :tasks
    def initialize(name)
        @name = name
        @tasks =[]
    end

    def add_task(task)
        tasks << task
    end
end

class TaskManager
    def initialize
        @tasks = []
    end

    def add_task(task,member)
        member.add_task(task)
        @tasks << task
        puts "タスク「#{task.name}」が担当者「#{member.name}」に追加されました"
    end
    
    def start_task(task)
        if task.status == "未着手"
            task.status = "進行中"
            puts "タスク「#{task.name}」が進行中に変わりました"
        else
            puts "タスク「#{task.name}」は未着手でないため、開始できません"
        end
    end

    def complete_task(task)
        if task.status == "進行中"
            task.status = "完了"
            puts "タスク「#{task.name}」は完了しました"
        else
            puts "タスク「#{task.name}」は進行中でないため、完了できません"
        end
    end

    def hold_task(task)
        if task.status == "進行中"
            task.status = "保留"
            puts "タスク「#{task.name}」は保留になりました"
        else
            puts "タスク「#{task.name}」は進行中でないため、保留にすることができません"
        end
    end

    def resume_task(task)
        if task.status == "保留"
            task.status = "進行中"
            puts "タスク「#{task.name}」は再開され、進行中になりました"
        else
            puts "タスク「#{task.name}」は保留でないため、再開できません"
        end
    end

    def delete_task(task)
        if task.status == "未着手" || task.status == "完了"
            @tasks.delete(task) # Taskmanagerクラスのインスタンス変数@tasks配列内のtaskをdelete
            task.assignee.tasks.delete(task)
            puts "タスク「#{task.name}」が削除されました"
        else
            puts "タスク「#{task.name}」が未着手または完了でないため、削除できません"
        end
    end

    def list_tasks
        puts "\n=== タスク一覧 ==="
        @tasks.each {|task| puts task}
        puts "=================\n\n"
    end
end

# タスクの作成
task1 = Task.new("Write Report", TeamMember.new("Taira"), "高")
task2 = Task.new("Fix Bug", TeamMember.new("Alex"), "中")
task3 = Task.new("Prepare Presentation", TeamMember.new("Taira"), "低")

# チームメンバーの作成
member1 = TeamMember.new("Taira")
member2 = TeamMember.new("Alex")

# タスクの管理
manager = TaskManager.new
manager.add_task(task1, member1)
manager.add_task(task2, member2)
manager.add_task(task3, member1)

# タスクの状態変更
manager.start_task(task1)     # 「未着手」→「進行中」
manager.complete_task(task1)  # 「進行中」→「完了」
manager.hold_task(task2)      # 「未着手」のため、保留不可
manager.start_task(task2)     # 「未着手」→「進行中」
manager.hold_task(task2)      # 「進行中」→「保留」
manager.resume_task(task2)    # 「保留」→「進行中」

# タスクの削除
manager.delete_task(task1)    # 削除成功（完了済み）
manager.delete_task(task2)    # 削除失敗（進行中）

# タスク一覧の表示
manager.list_tasks
```

# 問2 答え
```ruby
class Task
  attr_accessor :name, :assignee, :status

  def initialize(name)
    @name = name
    @assignee = nil
    @status = "未着手" # 新しいタスクはすべて未着手
  end

  def to_s
    assignee_name = assignee ? assignee.name : "未割り当て"
    "#{name} (担当者: #{assignee_name}, 状態: #{status})"
  end
end

class TeamMember
  attr_accessor :name, :tasks

  def initialize(name)
    @name = name
    @tasks = []
  end

  def add_task(task)
    tasks << task
  end
end

class TaskManager
  def initialize
    @tasks = []
  end

  # タスクを担当者に割り当て、整合性を保つ
  def add_task(task, member)
    # タスクに担当者を設定
    task.assignee = member
    # 担当者にタスクを追加
    member.add_task(task)
    # TaskManagerのリストにもタスクを追加
    @tasks << task
    puts "タスク「#{task.name}」が担当者「#{member.name}」に追加されました"
  end
  
  def start_task(task)
    if task.status == "未着手"
      task.status = "進行中"
      puts "タスク「#{task.name}」が進行中になりました"
    else
      puts "タスク「#{task.name}」は未着手でないため、開始できません"
    end
  end

  def complete_task(task)
    if task.status == "進行中"
      task.status = "完了"
      puts "タスク「#{task.name}」は完了しました"
    else
      puts "タスク「#{task.name}」は進行中でないため、完了できません"
    end
  end

  def hold_task(task)
    if task.status == "進行中"
      task.status = "保留"
      puts "タスク「#{task.name}」は保留になりました"
    else
      puts "タスク「#{task.name}」は進行中でないため、保留にできません"
    end
  end

  def resume_task(task)
    if task.status == "保留"
      task.status = "進行中"
      puts "タスク「#{task.name}」は再開され、進行中になりました"
    else
      puts "タスク「#{task.name}」は保留でないため、再開できません"
    end
  end

  def delete_task(task)
    if task.status == "未着手" || task.status == "完了"
      @tasks.delete(task)
      task.assignee.tasks.delete(task) if task.assignee
      puts "タスク「#{task.name}」が削除されました"
    else
      puts "タスク「#{task.name}」が未着手または完了でないため、削除できません"
    end
  end

  def list_tasks
    puts "\n=== タスク一覧 ==="
    @tasks.each { |task| puts task }
    puts "=================\n\n"
  end
end

# チームメンバーの作成
member1 = TeamMember.new("Takeshi")
member2 = TeamMember.new("Alex")

# タスクの作成（担当者はここではまだ設定しない）
task1 = Task.new("Write Report")
task2 = Task.new("Fix Bug")
task3 = Task.new("Prepare Presentation")

# タスクの管理（ここでタスクと担当者を関連付ける）
manager = TaskManager.new
manager.add_task(task1, member1)
manager.add_task(task2, member2)
manager.add_task(task3, member1)

# タスクの状態変更
manager.start_task(task1)     # 「未着手」→「進行中」
manager.complete_task(task1)  # 「進行中」→「完了」
manager.hold_task(task2)      # 「未着手」のため、保留不可
manager.start_task(task2)     # 「未着手」→「進行中」
manager.hold_task(task2)      # 「進行中」→「保留」
manager.resume_task(task2)    # 「保留」→「進行中」

# タスクの削除
manager.delete_task(task1)    # 削除成功（完了済み）
manager.delete_task(task2)    # 削除失敗（進行中）

# タスク一覧の表示
manager.list_tasks

```
