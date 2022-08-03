class MyTracks
    def initialize
        @tracks = []
    end

    def list
        return @tracks
    end

    def add(song)
        fail "Please enter a valid song" if song.length == 0
        
        @tracks << song unless @tracks.include?(song)
    end
end