require 'my_tracks'

RSpec.describe MyTracks do
    context "if no songs are added" do
        it "returns an empty list" do
            my_tracks = MyTracks.new
            expect(my_tracks.list).to eq []
        end
    end

    context "given an empty string" do
        it "fails" do
            my_tracks = MyTracks.new
            expect { my_tracks.add("") }.to raise_error "Please enter a valid song"
        end
    end

    context "given songs" do
        it "adds it to the list" do
            my_tracks = MyTracks.new
            my_tracks.add("song1")
            my_tracks.add("song2")
            list = my_tracks.list
            expect(list).to eq ["song1", "song2"]
        end
    end

    context "given duplicate songs" do
        it "does not create duplicates in the list" do
            my_tracks = MyTracks.new
            my_tracks.add("song1")
            my_tracks.add("song1")
            expect(my_tracks.list).to eq ["song1"]
        end
    end
end