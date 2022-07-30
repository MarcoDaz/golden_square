require 'present'

RSpec.describe Present do
    context "when contents has already been wrapped" do
        it "fails" do
            present = Present.new
            present.wrap("potato")
            expect { present.wrap("potato") }.to raise_error "A contents has already been wrapped."
        end
    end

    context "when no contents have been wrapped" do
        it "fails" do
            present = Present.new
            expect { present.unwrap }.to raise_error "No contents have been wrapped."
        end
    end

    context "can wrap and unwrap a value" do
        it "can wrap and unwrap a number" do
            present = Present.new
            present.wrap(-10.5)
            expect(present.unwrap).to eq -10.5
        end

        it "can wrap and unwrap a string" do
            present = Present.new
            present.wrap("Hello World!")
            expect(present.unwrap).to eq "Hello World!"
        end

        it "can wrap and unwrap a boolean" do
            present = Present.new
            present.wrap(true)
            expect(present.unwrap).to eq true
        end
    end
end