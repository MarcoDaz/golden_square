require 'add_five'

RSpec.describe "add_five_method" do
    it "adds 5 to 3 to return 8" do
        result = add_five(3)
        expect(result).to eq 8
    end

    it "adds 5 to -2.5 to return 2.5" do
        result = add_five(-2.5)
        expect(result).to eq 2.5
    end

    it "adds 5 to -10 to return -5" do
        result = add_five(-10) do
            result = add_five(-10)
            expect(result).to eq -5
        end
    end
end

