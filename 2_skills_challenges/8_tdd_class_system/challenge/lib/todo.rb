class Todo
    def initialize(task) # task is a string
        fail "Please enter a valid task" if task.length == 0
        @task = task
        @done= false
    end

    def task
        @task
    end

    def mark_done!
        @done = true
    end

    def done?
        @done
    end
end