class TodoList
    def initialize
        @incomplete = []
        @complete = []
    end

    def add(todo) # todo is an instance of Todo
        @incomplete << todo
    end

    def incomplete
        @incomplete
    end

    def complete
        @complete
    end

    def give_up!
        @complete = @incomplete.map do |todo|
            todo.mark_done!
            todo
        end
        @incomplete = []
    end
end