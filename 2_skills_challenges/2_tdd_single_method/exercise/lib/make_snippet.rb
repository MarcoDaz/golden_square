# TDD Process:
# 1. Write a small example as a test
# 2. Run the test (RED)
# 3. Write enough code to make that test pass
# 4. Run the test (GREEN)
# 5. Refactor if necessary
# 6. Return to step 1 and keep going until your program is complete


# Design: A method called make_snippet that takes a string as an argument and returns the first five words and then "..." if there are more than that.

def make_snippet(str)
    if str.length <= 5
        return str
    else
        return str[0, 5] + "..."
    end
end