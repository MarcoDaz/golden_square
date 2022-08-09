require 'task_formatter'

RSpec.describe TaskFormatter do
    it "can return an incomplete task formatted" do
        task = double(:task, title: "Title", complete?: false)
        task_formatter = TaskFormatter.new(task)
        expect(task_formatter.format).to eq "[ ] Title"
    end

    it "can return a completed task formatted" do
        task = double(:task, title: "Title", complete?: true)
        task_formatter = TaskFormatter.new(task)
        expect(task_formatter.format).to eq "[x] Title"
    end
end