require "music_library"

RSpec.describe MusicLibrary do
    it "initializes with empty list" do
          music_library = MusicLibrary.new
          expect(music_library.all).to eq []  
    end

    it "can add tracks" do
        track_1 = double :track_1
        track_2 = double :track_2
        music_library = MusicLibrary.new
        music_library.add(track_1)
        music_library.add(track_2)
        expect(music_library.all).to eq [track_1, track_2]
    end

    describe "# search?" do
        it "returns a list of tracks with matching keywords" do
            track_1 = double :track_1
            expect(track_1)
                .to receive(:matches?)
                .with("keyword")
                .and_return(false)

            track_2 = double :track_2
            expect(track_2)
                .to receive(:matches?)
                .with("keyword")
                .and_return(true)
                    
            music_library = MusicLibrary.new
            music_library.add(track_1)
            music_library.add(track_2)

            results = music_library.search("keyword")
            expect(results).to eq [track_2]
        end

        it "returns an empty list if no matcing keywords" do
            track_1 = double :track
            expect(track_1)
                .to receive(:matches?)
                .with("keyword")
                .and_return(false)
            track_2 = double :track

            expect(track_2)
                .to receive(:matches?)
                .with("keyword")
                .and_return(false)
                    
            music_library = MusicLibrary.new
            music_library.add(track_1)
            music_library.add(track_2)

            results = music_library.search("keyword")
            expect(results).to eq []
        end
    end
end