require 'say_hello'

RSpec.describe "say_hello method" do
    context "the string 'polo'" do
        it "returns 'hello polo'" do
            output = say_hello("polo")
            expect(output).to eq "hello polo"
        end
    end
end