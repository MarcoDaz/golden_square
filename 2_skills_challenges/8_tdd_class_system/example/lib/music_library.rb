class MusicLibrary
    def initialize
        @tracks = []
    end
  
    def add(track) # track is an instance of Track
        @tracks << track
    end
  
    def all
        return @tracks
    end
    
    # @tracks = [ track_instance, ... ]
    # track_instance.title = "song title"
    def search_by_title(keyword) # keyword is a string
        # Returns a list of tracks with titles that include the keyword
        # .downcase on title and keyword insures searching is not case sensitive
        return @tracks.select { |track| track.title.downcase.include?(keyword.downcase) }
    end
  end