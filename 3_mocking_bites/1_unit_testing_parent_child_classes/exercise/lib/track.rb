class Track
    def initialize(title, artist)
        fail "Cannot use empty string for title or artist" unless title.length > 0 && artist.length > 0
        @title = title
        @artist = artist
    end
  
    def matches?(keyword) 
        @title.include?(keyword) || @artist.include?(keyword)
    end
  end