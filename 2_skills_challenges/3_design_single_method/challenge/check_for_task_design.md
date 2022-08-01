# Check For Task Method Design Recipe

## Describe the Problem

Put or write the user story here. Addd any clarifying notes you might have.

> As a user <br>
> So that I can keep track of my tasks <br>
> I want to check if a text includes the string #TODO

## Design the Method Signature

Include the name of the method, it's parameters, return value, and side effects.

```ruby
is_task = check_for_task(text)

# * text is a string with words in it
# is_task is a boolean representing if the text contains "#TODO"
```

## Create Examples as Tests

Make a list of examples of what the method will take and return.

```ruby
# 1
check_for_task("")
# => fail, "Not a valid input"

# 2
check_for_task("Hello World!")
# => false


# 3
check_for_task("#TODO Need to do laundry")
# => true

# 4
check_for_task("Need to do laundry #TODO get more laundry detergent")
# => true
```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour