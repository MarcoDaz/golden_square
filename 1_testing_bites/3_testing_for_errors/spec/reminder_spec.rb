require 'reminder'

RSpec.describe Reminder do
    context "when no task is set" do
        it "fails" do
            reminder = Reminder.new("Polo")
            expect { reminder.remind() }.to raise_error "No reminder set!"
        end
    end

    context "when reminder is set" do
        it "keeps track of tasks" do
            reminder = Reminder.new("Polo")
            reminder.remind_me_to("Hoover")
            output = reminder.remind
            expect(output).to eq "Hoover, Polo!"
        end
    end
end