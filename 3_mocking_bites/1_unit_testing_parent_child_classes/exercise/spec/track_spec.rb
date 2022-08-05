require 'track'

RSpec.describe Track do
    context "when initialized an empty string for title or artist" do
        it "fails" do
            expect { Track.new("", "") }.to raise_error "Cannot use empty string for title or artist" 
            expect { Track.new("title", "") }.to raise_error "Cannot use empty string for title or artist" 
            expect { Track.new("", "artist") }.to raise_error "Cannot use empty string for title or artist" 
        end
    end

    describe "# matches?" do
        context "when keyword matches title" do
            it "returns true" do
                track = Track.new("title", "artist")
                expect(track.matches?("title")).to eq true
            end
        end

        context "when keyword matches artist" do
            it "returns true" do
                track = Track.new("title", "artist")
                expect(track.matches?("artist")).to eq true
            end
        end

        context "when keyword has no matches" do
            it "returns true" do
                track = Track.new("title", "artist")
                expect(track.matches?("random")).to eq false
            end
        end
    end
    
end