# Estimate Reading Time Method Design Recipe

## Describe the Problem

Put or write the user story here. Addd any clarifying notes you might have.

> As a user <br>
> So that I can manage my time <br>
> I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute

## Design the Method Signature

_Include the name of the method, it's parameters, return value, and side effects.

```ruby
reading_time = estimate_readingtime(text)

# * text is a string with words in it
# reading_time is an integer representing minutes

```

## Create Examples as Tests

Make a list of examples of what the method will take and return.

```ruby
# 1
estimate_readtime("")
# => 0

# 1
estimate_readtime("one two")
# => 1

# 2
estimate_readtime(TWO_HUNDRED_WORDS)
# => 1

# 3
estimate_readtime(THREE_HUNDREED_WORDS)
# => 2

# 4
estimate_readtime(FOUR_HUNDRED_WORDS)
# => 2

# 5
estimate_readtime(SIX_THOUSAND_WORDS)
# => 30

```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour