# TaskTracker Class Design Recipe

## Describe the Problem

_Put or write the user story here. Addd any clarifying notes you might have.

> As a user <br>
> So that I can keep track of my tasks <br>
> I want a program that I can add todo tasks to and see a list of them

> As a user <br>
> So that I can focus on tasks to complete <br>
> I want to mark tasks as complete and have them disappear from the list

## Design the Method Signature

_Include the name of the method, it's parameters, return value, and side effects.

```ruby

class TaskTracker
    def initialize
    end

    def list
        # returns list of tasks
    end

    def add(task) # task is a string
    end

    def complete(task) # deletes task from list of tasks
        # fails if task not valid
    end
end

```

## Create Examples as Tests

_Make a list of examples of what the method will take and return.

```ruby
# 1
task_tracker = TaskTracker.new
task_tracker.tasks # => []

# 2
task_tracker = TaskTracker.new
task_tracker.add("") # => fails

# 3
task_tracker = TaskTracker.new
task_tracker.add("task1")
task_tracker.add("task2")
task_tracker.list # => ["task1", "task2"]

# 4
task_tracker = TaskTracker.new
task_tracker.add("task1")
task_tracker.add("task1")
task_tracker.list # => ["task1"]

# 5
task_tracker = TaskTracker.new
task_tracker.add("task1")
task_tracker.add("task2")
task_tracker.complete("task1")
task_tracker.list # => ["task2"]

# 6
task_tracker = TaskTracker.new
task_tracker.add("task1")
task_tracker.complete("task2") # => fails
```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour