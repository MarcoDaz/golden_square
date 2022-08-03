class Track
    def initialize(title, artist) # title and artist are both strings
      @title = title
      @artist = artist
    end
  
    def title
      return @title
    end
  
    def format
      return "#{@title} by #{@artist}"
    end
  end