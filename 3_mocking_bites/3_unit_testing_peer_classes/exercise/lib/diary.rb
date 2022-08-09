class Diary
    def initialize(contents) # contents is a string
        fail "Invalid contents" if contents.length == 0
        @contents = contents
    end
  
    def read
      # Returns the contents of the diary
      @contents
    end
  end