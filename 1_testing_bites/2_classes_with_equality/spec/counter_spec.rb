require 'counter'

RSpec.describe Counter do
    it "can keep count of added numbers 1, 2, -10" do
        counter = Counter.new
        counter.add(1)
        counter.add(2)
        counter.add(-10)
        result = counter.report
        expect(result).to eq "Counted to -7 so far."
    end

    it "can keep count of added numbers 1.5, 2, -5" do
        counter = Counter.new
        counter.add(1.5)
        counter.add(2)
        counter.add(-5)
        result = counter.report
        expect(result).to eq "Counted to -1.5 so far."
    end
end