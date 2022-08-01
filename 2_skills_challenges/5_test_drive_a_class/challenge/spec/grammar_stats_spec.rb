require 'grammar_stats'

RSpec.describe GrammarStats do
    describe "#check" do
        context "given an empty string" do
            it "fails" do
                grammar_stats = GrammarStats.new
                expect { grammar_stats.check("") }.to raise_error "Please enter a valid text"
            end
        end

        context "given a grammatically incorrect text" do
            it "returns false when there is no capital letter" do
                grammar_stats = GrammarStats.new
                text = "hello world!"
                expect(grammar_stats.check(text)).to eq false
            end

            it "returns false when there is only a capital letter" do
                grammar_stats = GrammarStats.new
                expect(grammar_stats.check("Hello world")).to eq false
                expect(grammar_stats.check("Hello world")).to eq false
                expect(grammar_stats.check("Hello world")).to eq false
            end
        end

        context "given a grammatically correct text" do
            it "returns true" do
                grammar_stats = GrammarStats.new
                text = "Hello World!"
                expect(grammar_stats.check(text)).to eq true
            end
        end
    end

    describe "#percentage_good" do
        context "if there are no texts checked yet" do
            it "fails" do
                grammar_stats = GrammarStats.new
                expect { grammar_stats.percentage_good }.to raise_error "No texts checked yet"
            end
        end

        context "when texts are checked" do
            it "returns percentage of texts that have been corrrect" do
                grammar_stats = GrammarStats.new

                grammar_stats.check("Hello world!")
                percentage1 = grammar_stats.percentage_good # => 100

                grammar_stats.check("Hello world")
                percentage2 = grammar_stats.percentage_good # => 50

                grammar_stats.check("lets mix it up")
                percentage3 = grammar_stats.percentage_good # => 33

                grammar_stats.check("hello world!")
                percentage4 = grammar_stats.percentage_good # => 25

                expect(percentage1).to eq 100
                expect(percentage2).to eq 50
                expect(percentage3).to eq 33
                expect(percentage4).to eq 25
            end

            it "returns 0 if no texts checked have been correct" do
                grammar_stats = GrammarStats.new

                grammar_stats.check("Hello")
                percentage = grammar_stats.percentage_good # => 0
                expect(percentage).to eq 0
            end
        end
    end
end