require 'count_words'

RSpec.describe "count_words method" do
    it "returns 0 for an empty string" do
        output = count_words("")
        expect(output).to eq 0
    end

    it "returns 0 for a string with just spaces" do
        output = count_words("     ")
        expect(output).to eq 0
    end

    it "returns 2 for the string 'Hello World!'" do
        output = count_words("Hello World!")
        expect(output).to eq 2
    end
end