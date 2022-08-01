require 'encode_decode'

RSpec.describe "encode & decode methods" do
    context "for the encode method" do
        it "returns the correct encoded string" do
            output = encode("theswiftfoxjumpedoverthelazydog", "secretkey")
            expect(output).to eq "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
        end
    end

    context "for the decode method" do
        it "returns the correct decoded string" do
            output = decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
            expect(output).to eq "theswiftfoxjumpedoverthelazydog"
        end
    end
end