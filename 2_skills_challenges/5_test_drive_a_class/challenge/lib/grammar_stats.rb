class GrammarStats
    def initialize
      # ...
      @texts_checked = 0
      @correct_texts = 0
    end
  
    def check(text) # text is a string
      # Fails if text is an emptry string
        fail "Please enter a valid text" if text.length == 0

      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
        is_capitalised = text[0] == text[0].upcase

        endings = /[.!?]/
        correct_ending = text =~ endings ? true : false

        is_correct = is_capitalised && correct_ending
        @texts_checked += 1
        @correct_texts += 1 if is_correct

        return is_correct
    end
  
    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
      fail "No texts checked yet" if @texts_checked == 0

      return (@correct_texts * 100 / @texts_checked.to_f).round
    end
  end