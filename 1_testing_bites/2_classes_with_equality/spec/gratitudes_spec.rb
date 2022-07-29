require 'gratitudes'

RSpec.describe Gratitudes do
    it "Keep track of added gratitudes" do
        gratitudes = Gratitudes.new
        gratitudes.add("Food")
        gratitudes.add("Music")
        gratitudes.add("Friends")
        output = gratitudes.format
        expect(output).to eq "Be grateful for: Food, Music, Friends"
    end
end