# TDD Process:
# 1. Write a small example as a test
# 2. Run the test (RED)
# 3. Write enough code to make that test pass
# 4. Run the test (GREEN)
# 5. Refactor if necessary
# 6. Return to step 1 and keep going until your program is complete


# Design: A method called count_words that takes a string as an argument and returns the number of words in the string

def count_words(str)
    words = str.split(' ')
    return words.length
end