class Diary
    def initialize
        @entries = []
    end
  
    def add(entry) # entry is an instance of DiaryEntry
        @entries << entry
    end
  
    def all
        @entries
    end
  
    def count_words
      # Returns the number of words in all diary entries
      # HINT: This method should make use of the `count_words` method on DiaryEntry.
        sum = 0
        @entries.each { |entry| sum += entry.count_words }
        
        sum
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
        fail "Please enter a reading speed greater than 0" unless wpm > 0

        (count_words / wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.
        fail "Please enter a reading speed and time greater than 0" unless wpm > 0 && minutes > 0

        readable_words = wpm * minutes

        best_entry = @entries
            .sort_by { |entry| entry.count_words }
            .reverse # largest word count first
            .find { |entry| entry.count_words <= readable_words }
        
        fail "No entry readable given the available time" unless best_entry

        return best_entry
    end
  end