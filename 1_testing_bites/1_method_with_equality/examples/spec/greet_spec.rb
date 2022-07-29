require 'greet'

RSpec.describe "greet method" do
    it "Says hello to Makers with ! to return 'Hello, Makers!'" do
        result = greet("Makers")
        expect(result).to eq "Hello, Makers!"
    end

    it "Says hello to 007 with ! to return 'Hello, 007!'" do
        result = greet("007")
        expect(result).to eq "Hello, 007!"
    end

    it "Says hello to Coaches with ! to return 'Hello, Coaches!'" do
        result = greet("Coaches")
        expect(result).to eq "Hello, Coaches!"
    end
end