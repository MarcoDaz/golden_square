# Check Grammar Method Design Recipe

## Describe the Problem

Put or write the user story here. Addd any clarifying notes you might have.

> As a user <br>
> So that I can improve my grammar <br>
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## Design the Method Signature

Include the name of the method, it's parameters, return value, and side effects.

```ruby
is_correct = check_grammar(text)

# * text is a string with words in it
# is_correct is an boolean representing if the text checks out
# sentence-ending punctuations: . ! ?

```

## Create Examples as Tests

Make a list of examples of what the method will take and return.

```ruby
# 1
check_grammar("")
# => fails "Not a sentence."

# 2
check_grammar("Hello world.")
# => true

# 3
check_grammar("hello world.")
# => false

# 4
check_grammar("hello world.")
# => true

# 5
check_grammar("Hello world?")
# => true

# 6
check_grammar("Hello world!")
# => true

# 7

check_grammar("Hello world")
# => true
```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour