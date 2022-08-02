class TaskTracker
    def initialize
        @tasks = []
    end

    def tasks
        return @tasks
    end

    def add(task)
        fail "Please enter a valid task" if task.length == 0

        @tasks << task unless @tasks.include?(task)
    end

    def complete(task)
        fail "Given task is not on the list" if !@tasks.delete(task)
    end
end