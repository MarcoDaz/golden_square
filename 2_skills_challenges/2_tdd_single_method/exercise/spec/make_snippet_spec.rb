require 'make_snippet'

RSpec.describe "make_snippet method" do
    it "returns the same string without '...' if it's length <= 5" do
        output = make_snippet("12345")
        expect(output).to eq "12345"
    end

    it "returns the first 5 characters and '...' if the input strings length > 5" do
        output = make_snippet("123456")
        expect(output).to eq "12345..."
    end
end