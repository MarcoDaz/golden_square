require 'todo'

RSpec.describe Todo do
    context "when initialised with an empty string" do
        it "fails" do
            expect { Todo.new("") }.to raise_error "Please enter a valid task"
        end
    end

    context "when intialized with task" do
        it "can return the task" do
            todo = Todo.new("task")
            expect(todo.task).to eq "task"
        end

        it "returns false for done?" do
            todo = Todo.new("task")
            expect(todo.done?).to eq false
        end
    end

    context "when a task is marked done" do
        it "returns true for done?" do
            todo = Todo.new("task")
            todo.mark_done!
            expect(todo.done?).to eq true
        end
    end
end