# Phone Book Class Design Recipe

## Describe the Problem

_Put or write the user story here. Addd any clarifying notes you might have.

> As a user <br>
> So that I can keep track of my phone numbers <br>
> I to keep a record of all phone numbers I use in my entries

## Design the Method Signature

_Include the name of the method, it's parameters, return value, and side effects.

```ruby
class PhoneBook
    def initializer
    end

    def extract_numbers(text) # text is a string representing a journal entry
        # Returns nothing
    end

    def list
        # Returns a list of strings representing phone numbers
    end
end
```

## Create Examples as Tests

_Make a list of examples of what the method will take and return.

```ruby
# 1
phone_book = PhoneBook.new
phone_book.list # => []

# 2
phone_book = PhoneBook.new
phone_book.extract_numbers("07812345678")
phone_book.list # => ["07812345678"]

# 3
phone_book = PhoneBook.new
phone_book.extract_numbers("I was calling my friend 07812345678")
phone_book.list # => ["07812345678"]

# 4
phone_book = PhoneBook.new
phone_book.extract_numbers("fave numbers: 07812345678, 17812345678, 27812345678")
phone_book.list # => ["07812345678", "17812345678", "27812345678"]

# 5
phone_book = PhoneBook.new
phone_book.extract_numbers("potato")
phone_book.list # => []

# 6
phone_book = PhoneBook.new
phone_book.extract_numbers("07812345678")
phone_book.extract_numbers("17812345678")
phone_book.extract_numbers("27812345678")
phone_book.list # => ["07812345678", "17812345678", "27812345678"]

# 7 - too few digits
phone_book = PhoneBook.new
phone_book.extract_numbers("0781234567")
phone_book.extract_numbers("078123456789")
phone_book.list # => []

# 8 - no duplicates
phone_book = PhoneBook.new
phone_book.extract_numbers("number 1: 07812345678")
phone_book.extract_numbers("number 2: 07812345678")
phone_book.list # => ["07812345678"]

```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour