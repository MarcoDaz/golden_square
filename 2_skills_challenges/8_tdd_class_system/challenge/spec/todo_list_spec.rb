require 'todo_list'

RSpec.describe TodoList do
    context "when no todo's are added" do
        it "returns empty lists" do
            todo_list = TodoList.new
            expect(todo_list.incomplete).to eq []
            expect(todo_list.complete).to eq []
        end
    end
end