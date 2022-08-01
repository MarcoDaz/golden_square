require 'check_for_task'

RSpec.describe "check_for_task method" do
    context "given an empty string" do
        it "fails" do
            expect { check_for_task("") }.to raise_error "Not a valid input"
        end
    end

    context "given a string with no #TODO" do
        it "returns false" do
            output = check_for_task("Hello World!")
            expect(output).to eq false
        end
    end

    context "given a string with #TODO in it" do
        it "returns true" do
            output = check_for_task("#TODO Need to do laundry")
            expect(output).to eq true
        end

        it "returns true" do
            output = check_for_task("Need to do laundry #TODO get more laundry detergent")
            expect(output).to eq true
        end
    end
end