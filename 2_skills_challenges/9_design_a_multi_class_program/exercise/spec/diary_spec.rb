require 'diary'

RSpec.describe Diary do
    context "when no tasks or entries are added" do
        it "returns empty lists" do
            diary = Diary.new
            expect(diary.entries).to eq []
            expect(diary.tasks).to eq []
            expect(diary.contacts).to eq []
        end
    end

    context "given an empty string as a task" do
        it "fails" do
            diary = Diary.new
            expect { diary.add_task("") }.to raise_error "Please enter a valid task"
        end
    end

    context "given tasks" do
        it "stores all the tasks" do
            diary = Diary.new
            diary.add_task("task_1")
            diary.add_task("task_2")
            expect(diary.tasks).to eq ["task_1", "task_2"]
        end
    end
end