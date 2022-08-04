require 'todo_list'
require "todo"

RSpec.describe "Integration" do
    context "when adding multiple todo's" do
        it "adds todo's in the incomplete list" do
            todo_list = TodoList.new
            todo_1 = Todo.new("task_1")
            todo_2 = Todo.new("task_2")
            todo_list.add(todo_1)
            todo_list.add(todo_2)
            expect(todo_list.complete).to eq []
            expect(todo_list.incomplete).to eq [todo_1, todo_2]
        end
    end

    context "when the user gives up" do
        it "returns an empty incomplete list" do
            todo_list = TodoList.new
            todo_1 = Todo.new("task_1")
            todo_2 = Todo.new("task_2")
            todo_list.add(todo_1)
            todo_list.add(todo_2)

            todo_list.give_up!
            expect(todo_list.incomplete).to eq []
        end

        it "all tasks are moved to complete list and marked done" do
            todo_list = TodoList.new

            todo_1 = Todo.new("task_1")
            todo_2 = Todo.new("task_2")
            todo_list.add(todo_1)
            todo_list.add(todo_2)

            todo_list.give_up! # this should also change todo_1.done? as it is stored in one place as an object instance
            expect(todo_list.incomplete).to eq []

            expect(todo_list.complete).to eq [todo_1, todo_2]
            
            all_done = todo_list.complete.all? { |todo| todo.done? == true}
            expect(all_done).to eq true
        end

    end
end