require 'music_library'
require 'track'

RSpec.describe "Integration" do
    context "when we add tracks to the library" do
        it "returns a list with all the tracks" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            expect(library.all).to eq [track_1, track_2]
        end
    end

    context "when we search for a track by title" do
        it "returns all the relevant tracks" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            results = library.search_by_title("Carte")
            expect(results).to eq [track_1]
        end
    end

    context "when we for a track by a substring of a title" do
        it "returns all the relevant tracks" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            results = library.search_by_title("sy")
            expect(results).to eq [track_2]
        end
    end

    context "when there are no results from a search" do
        it "returns an empty list" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            results = library.search_by_title("zzz")
            expect(results).to eq []
        end
    end

    context "when creating a new tack" do
        it "can return the track title and artist formatted" do
            track = Track.new("Carte Blanche", "Veracocha")
            expect(track.format).to eq "Carte Blanche by Veracocha"
        end
    end

end