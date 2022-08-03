class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        if title.length == 0 || contents.length == 0
            fail "Please enter a valid title and contents"
        end
        
        @title = title
        @contents = contents
        @chunk_point = 0
    end
  
    def title
        @title
    end
  
    def contents
        @contents
    end
  
    def count_words
        @contents.split(" ").length
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
        fail "Please enter a reading speed greater than 0" unless wpm > 0

        (count_words / wpm.to_f).ceil
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

        fail "Enter a value greater than 0 for reading speed and time" unless wpm > 0 && minutes > 0

        words_per_chunk = wpm * minutes
        return @contents if words_per_chunk >= count_words

        words = @contents.split(" ")

        output = words[@chunk_point, words_per_chunk].join(" ")
        @chunk_point += words_per_chunk
        @chunk_point = 0 if @chunk_point > count_words

        return output
    end
  end