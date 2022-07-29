require 'string_builder'

RSpec.describe StringBuilder do
    it "it can concatenate strings together" do
        string_builder = StringBuilder.new
        string_builder.add("a")
        string_builder.add("b")
        string_builder.add("c")
        result = string_builder.output
        expect(result).to eq "abc"
    end

    it "it can keep track of the total string length" do
        string_builder = StringBuilder.new
        string_builder.add("a")
        string_builder.add("b")
        string_builder.add("c")
        result = string_builder.size
        expect(result).to eq 3 
    end
end