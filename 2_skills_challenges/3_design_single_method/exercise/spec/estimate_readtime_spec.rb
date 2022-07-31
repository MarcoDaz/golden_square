require 'estimate_readtime'

RSpec.describe "estimate_readtime method" do
    context "given an empty string" do
        it "returns 0" do
            output = estimate_readtime("")
            expect(output).to eq 0
        end
    end

    context "given a text with less than 200 words" do
        it "returns 1" do
            output = estimate_readtime("one two")
            expect(output).to eq 1
        end
    end

    context "given a text with 200 words" do
        it "returns 1" do
            output = estimate_readtime("word " * 200)
            expect(output).to eq 1
        end
    end

    context "given a text with 300 words" do
        it "returns 2" do
            output = estimate_readtime("word " * 300)
            expect(output).to eq 2
        end
    end

    context "given a text with 400 words" do
        it "returns 2" do
            output = estimate_readtime("word " * 400)
            expect(output).to eq 2
        end
    end

    context "given a text with 6000 words" do
        it "returns 30" do
            output = estimate_readtime("word " * 6000)
            expect(output).to eq 30
        end
    end
end