class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      # ...
      @title = title
      @contents = contents
      @chunk_point = 0
    end
  
    def title
      # Returns the title as a string
      return @title
    end
  
    def contents
      # Returns the contents as a string
      return @contents
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
      return words.length
    end
  
    def reading_time(wpm) # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
        fail "Reading speed must be greater than 0" unless wpm > 0
        return (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
        
        # Fail given less than 0 for either wpm or minutes => fail
        fail "Reading speed and minutes must be greater than 0" unless wpm > 0 && minutes > 0

        words_per_chunk = wpm * minutes
        chunk = words[@chunk_point, words_per_chunk]

        @chunk_point += words_per_chunk
        @chunk_point = 0 if @chunk_point >= count_words

        return chunk.join(" ")
    end

    private

    def words
        @contents.split(" ")
    end
  end