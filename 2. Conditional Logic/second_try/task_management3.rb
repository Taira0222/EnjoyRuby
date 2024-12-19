class TeamMember
    attr_accessor :name, :tasks

    def initialize(name)
        @name = name
        @tasks = [] # => 1人の担当者で複数タスクを持つ可能性があるため
    end

    def add_task(task)
        tasks << task
    end

    # 担当者ごとに担当しているタスクを主力する
    def team_member_task_list
        
        puts "-----------担当者名 : #{@name}---------"
        @tasks.each {|task| puts "タスク名: #{task.name}"}
    end
end


class Task
    attr_accessor :name, :assign_member, :status
    def initialize(name)
        @name = name
        @assign_member = nil
        @status = "未着手"
    end
end

class TaskManager
    def initialize
        @tasks = []
    end

    def add_task(task,member)
        member.add_task(task) # => TeamMemberの@tasks配列にtaskを入れて紐づけさせる
        @tasks << task
        task.assign_member = member #=> taskに担当者を紐づけさせた。
    end

    def start_task(task)
        if task.status == "未着手"
            puts "「未着手」→「進行中」"
            task.status = "進行中"
        else 
            puts "タスクが未着手でないため、タスクを開始できません"
        end
    end

    def complete_task(task)
        if task.status == "進行中"
            puts "「進行中」→「完了」"
            task.status = "完了"
        else 
            puts "タスクが進行中でないため、作業を完了できません"
        end
    end

    def hold_task(task)
        if task.status == "進行中"
            puts "「進行中」→「保留」"
            task.status = "保留"
        elsif task.status == "未着手"
            puts "「未着手」のため、保留不可"
        else
            puts "「完了」のため、保留不可"
        end
    end

    def resume_task(task)
        if task.status == "保留"
            puts "「保留」→「進行中」"
            task.status = "進行中"
        else
            puts "タスクが「保留」でないのでタスクを再開できません"
        end
    end

    def delete_task(task)
        if task.status == "未着手" 
            puts "削除成功（未着手）"
            @tasks.delete(task)
            task.assign_member.tasks.delete(task)
        elsif task.status == "完了"
            puts "削除成功（完了済み）"
            @tasks.delete(task)
            task.assign_member.tasks.delete(task)
        else
            puts "削除失敗（進行中）"
        end
    end

    def list_tasks
        puts "\n------タスク一覧--------"
        @tasks.each{|task| puts "タスク名: #{task.name}"}
    end

end



# チームメンバーの作成
member1 = TeamMember.new("Taira")
member2 = TeamMember.new("Alex")

# タスクの作成
task1 = Task.new("Write Report")
task2 = Task.new("Fix Bug")
task3 = Task.new("Prepare Presentation")

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

# 担当者ごとのタスク一覧
member1.team_member_task_list
member2.team_member_task_list