require 'task_tracker'

RSpec.describe TaskTracker do
    context "when no tasks are added" do
        it "returns an empty list" do
            task_tracker = TaskTracker.new
            expect(task_tracker.tasks).to eq []
        end
    end

    context "when given an empty string for a task" do
        it "fails" do
            task_tracker = TaskTracker.new
            expect{ task_tracker.add("") }.to raise_error "Please enter a valid task"
        end
    end

    context "when given task/s" do
        it "stores the task/s" do
            task_tracker = TaskTracker.new
            task_tracker.add("task1")
            task_tracker.add("task2")
            list = task_tracker.tasks
            expect(list).to eq ["task1", "task2"]
        end
    end

    context "when given the a task already in the list" do
        it "doesn't create duplicates in the list" do
            task_tracker = TaskTracker.new
            task_tracker.add("task1")
            task_tracker.add("task1")
            expect(task_tracker.tasks).to eq ["task1"]
        end
    end

    context "when listed task is completed" do
        it "deletes the task from the list" do
            task_tracker = TaskTracker.new
            task_tracker.add("task1")
            task_tracker.add("task2")
            task_tracker.complete("task1")
            expect(task_tracker.tasks).to eq ["task2"]
        end
    end

    context "when a non listed task is completed" do
        it "fails" do
            task_tracker = TaskTracker.new
            task_tracker.add("task1")
            expect{ task_tracker.complete("task2") }.to raise_error "Given task is not on the list"
        end
    end
end