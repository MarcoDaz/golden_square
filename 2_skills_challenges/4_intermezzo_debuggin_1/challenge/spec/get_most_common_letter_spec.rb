require 'get_most_common_letter'

RSpec.describe "get_most_common_letter method" do
    context "given the string 'the roof, the roof, the roof is on fire!'" do
        it "returns 'o'" do
            output = get_most_common_letter("the roof, the roof, the roof is on fire!")
            expect(output).to eq "o"
        end
    end
end