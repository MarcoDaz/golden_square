require "task_list"
require "task"

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  it "can return an incomplete task formatted" do
    task = Task.new("Title")
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[ ] Title"
  end

  it "can return a completed task formatted" do
    task = Task.new("Title")
    task.mark_complete
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[x] Title"
  end
end
