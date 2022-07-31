require 'check_grammar'

RSpec.describe "check_grammar method" do
    context "given an empty string" do
        it "fails" do
            expect { check_grammar("") }.to raise_error "Not a sentence."
        end
    end

    context "given a sentence with a capital letter and full stop" do
        it "returns true" do
            is_correct = check_grammar("Hello world.")
            expect(is_correct).to eq true
        end
    end

    context "given a sentence that starts with a lowecase start" do
        it "returns false" do
            is_correct = check_grammar("hello world.")
            expect(is_correct).to eq false
        end
    end

    context "given a sentence with a full stop only" do
        it "returns false" do
            is_correct = check_grammar("hello world.")
            expect(is_correct).to eq false
        end
    end

    context "given a sentence with a capital letter and question mark" do
        it "returns true" do
            is_correct = check_grammar("Hello world?")
            expect(is_correct).to eq true
        end
    end
    
    context "given a sentence with a capital letter and exclamation point" do
        it "returns true" do
            is_correct = check_grammar("Hello world!")
            expect(is_correct).to eq true
        end
    end

    context "given a sentence with only a capital letter" do
        it "returns true" do
            is_correct = check_grammar("Hello world")
            expect(is_correct).to eq false
        end
    end
end