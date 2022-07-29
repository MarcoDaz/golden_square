require 'report_length'

RSpec.describe("report_length method") do
    it 'returns "This string was 12 characters long." for the string "Hello World!"' do
        result = report_length("Hello World!")
        expect(result).to eq "This string was 12 characters long."
    end

    it 'returns "This string was 44 characters long." for the string "The quick brown fox jumps over the lazy dog."' do
        result = report_length("The quick brown fox jumps over the lazy dog.")
        expect(result).to eq "This string was 44 characters long."
    end

end