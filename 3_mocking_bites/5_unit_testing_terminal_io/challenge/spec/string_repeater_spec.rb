require 'string_repeater'

RSpec.describe StringRepeater do
    describe "#run" do
        it "repeats the entered string for the to the desired amount" do
            io = double :io
            expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")

            expect(io).to receive(:puts).with("Please enter a string.")
            expect(io).to receive(:gets).and_return("TWIX")

            expect(io).to receive(:puts).with("Please enter a number of repeats.")
            expect(io).to receive(:gets).and_return("10")

            expect(io).to receive(:puts).with("Here is your result:")
            expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")
            
            string_repeater = StringRepeater.new(io)
            string_repeater.run
        end

        it "fails when entering an empty string" do
            io = double :io
            expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")

            expect(io).to receive(:puts).with("Please enter a string.")
            expect(io).to receive(:gets).and_return("")

            string_repeater = StringRepeater.new(io)
            expect { string_repeater.run }.to raise_error "Invalid string!"
        end

        context "given an invalid repeat" do
            it "fails for a number less than 1" do
                io = double :io
                expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")

                expect(io).to receive(:puts).with("Please enter a string.")
                expect(io).to receive(:gets).and_return("TWIX")

                expect(io).to receive(:puts).with("Please enter a number of repeats.")
                expect(io).to receive(:gets).and_return("-10")

                string_repeater = StringRepeater.new(io)
                expect { string_repeater.run }.to raise_error "Invalid repeats!"
            end

            it "fails for a non-integer number" do
                io = double :io
                expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")

                expect(io).to receive(:puts).with("Please enter a string.")
                expect(io).to receive(:gets).and_return("TWIX")

                expect(io).to receive(:puts).with("Please enter a number of repeats.")
                expect(io).to receive(:gets).and_return("10.55")

                string_repeater = StringRepeater.new(io)
                expect { string_repeater.run }.to raise_error "Invalid repeats!"
            end

            it "fails for a string rather than a number" do
                io = double :io
                expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")

                expect(io).to receive(:puts).with("Please enter a string.")
                expect(io).to receive(:gets).and_return("TWIX")

                expect(io).to receive(:puts).with("Please enter a number of repeats.")
                expect(io).to receive(:gets).and_return("Hello World!")

                string_repeater = StringRepeater.new(io)
                expect { string_repeater.run }.to raise_error "Invalid repeats!"
            end
        end
    end
end