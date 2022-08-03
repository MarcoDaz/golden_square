require 'track'

RSpec.describe Track do
    context "when constructued with a title and artist" do
        it "can return the title" do
            track = Track.new("title", "artist")
            expect(track.title).to eq "title"
        end

        it "can return the title and artist in the right format" do
            track = Track.new("title", "artist")
            expect(track.format).to eq "title by artist"
        end
    end
end