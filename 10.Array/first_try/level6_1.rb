class Task
    attr_accessor :title, :done

    def initialize(title, done=false)
        @title = title
        @done = done
    end
end

def complete_all(tasks)
    tasks.map do |task|
        if task.done == false
            task.done = true
        end
    end
    tasks
end

tasks =[
    Task.new("買い物"),
    Task.new("掃除"),
    Task.new("部屋の模様替え",true)
]

tasks = complete_all(tasks)
tasks.each do |task| 
    puts "タスク:#{task.title} 完了:#{task.done}"
end