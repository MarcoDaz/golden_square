require 'check_codeword'

RSpec.describe "checK_codeword method" do
    it "input 'horse' to return 'Correct! Come in.'" do
        result = check_codeword("horse")
        expect(result).to eq "Correct! Come in."
    end

    it "input 'habce' to return 'Close, but nope.'" do
        result = check_codeword("habce")
        expect(result).to eq "Close, but nope."
    end

    it "input 'let me in please' to return 'WRONG!'" do
        result = check_codeword("let me in please")
        expect(result).to eq "WRONG!"
    end

    it "input 'but I said please' to return 'WRONG!'" do
        result = check_codeword("but I said please")
        expect(result).to eq "WRONG!"
    end
end