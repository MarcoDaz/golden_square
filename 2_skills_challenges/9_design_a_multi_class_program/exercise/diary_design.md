# Diary Multi-Class Design Recipe

## Describe the Problem

Put or write the user story here. Addd any clarifying notes you might have.

> As a user <br>
> So that I can record my experiences <br>
> I want to keep a regular diary

> As a user <br>
> So that I can reflect on my experiences <br>
> I want to read my past diary entries

> As a user <br>
> So that I can reflect on my experiences in my busy day <br>
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user <br>
> So that I can keep track of my tasks <br>
> I want to keep a todo list along with my diary

> As a user <br>
> So that I can keep track of my contacts <br>
> I want to see a list of all of the mobile phone numbers in all my diary entries

## Design the Class System

Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

```
            ┌───────────────────────────────────────────────────────┐
            │ Diary                                                 │
            │                                                       │
            │ @entries = []                                         │
            │ @tasks = []                                           │
            │ @contacts = []                                        │
            │                                                       │
            │ add_entry(entry) => add to @entries (maybe @contacts) │
            │ read(entry_title)                                     │
            │ entries => list of entrys                             │
            │ best_entry(wpm, minutes) => best_entry                │
            │ add_task(task)                                        │
            │ tasks => @tasks                                       │
            │                                                       │
            │ contacts => return @contacts                          │
            └─────────────┬─────────────────────────────────────────┘
                          │
                          │ Diary holds 0 or more Entries
                          │ Diary needs to check entry count_words
                          │ Diary needs to for uniqure contact no.s
                          │
            ┌─────────────┴───────────────────┐
            │ Entry                           │
            │                                 │
            │ title => @title                 │
            │ contents => @content            │
            │                                 │
            │ count_words => sum of words     │
            │ cotacts => unique contact no.s  │
            └─────────────────────────────────┘
```

Also design the interface of each class in more detail.

```ruby
Class Diary
    def add_entry(entry) # entry is an instance of Entry
        # adds to list of entries
        # adds entry's contact numbers to contacts list
        # returns nothing
    end

    def read(entry_title) # entry_title is a string to find the matching entry
        # returns the matching entry's contents
    end

    def entries
        # returns list of entry instances
    end

    def best_entry(wpm, minutes) # both positive numbers
        # return entry with longest content that can be read given wpm & minutes
    end

    def add_task(task) # task is a string
        # adds task to tasks list
        # returns nothing
    end

    def tasks
        # returns list of tasks
    end

    def contacts
        # returns a list of phone no.'s in all entries
    end
end

Class Entry
    def title
        # return title
    end

    def contents
        # return contents
    end

    def count_words
        # returns the total words in @contents
    end

    def contacts
        # returns list of unique contact no.s OR empty list if none
    end
end

```

## Create Examples as Integration Tests

Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.


```ruby
# 1 Can it store entries
diary = Diary.new
entry_1 = Entry.new('title_1', 'contents_1')
entry_2 = Entry.new('title_2', 'contents_2')
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.entries # => [entry_1, entry_2]

# 2 Can it search for a entry given a title
diary = Diary.new
entry_1 = Entry.new('title_1', 'contents_1')
entry_2 = Entry.new('title_2', 'contents_2')
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.read('title_1') # => entry_1.contents

# 2.5 Fails if no matching entry with title given
diary = Diary.new
entry_1 = Entry.new('title_1', 'contents_1')
entry_2 = Entry.new('title_2', 'contents_2')
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.read('random') # => fails

# 3 Can it find the best entry for reading time and speed given
diary = Diary.new
entry_1 = Entry.new('title_1', 'one ' * 200)
entry_2 = Entry.new('title_2', 'one ' * 300)
entry_3 = Entry.new('title_3', 'one ' * 400)
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.add_entry(entry_3)
diary.best_entry(100, 3) # => entry_2

# 4 Fail if no suitable entries given wpm & minutes
diary = Diary.new
entry_1 = Entry.new('title_1', 'one ' * 400)
entry_2 = Entry.new('title_2', 'one ' * 500)
diary.add_entry(entry_1)
diary.add_entry(entry_2)

diary.best_entry(100, 3) # => fails

# 5 Can it store numbers from added entries
diary = Diary.new
entry_1 = Entry.new('title_1', 'no. 07812345678')
entry_2 = Entry.new('title_2', 'no. 17812345678')
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.contacts # => ['07812345678', '17812345678']

# 6 can store multiple numbers from one entry
diary = Diary.new
entry_1 = Entry.new('title_1', 'no.s 07812345678, 27812345678')
entry_2 = Entry.new('title_2', 'no. 17812345678')
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.contacts # => ['07812345678', '27812345678', '17812345678']

# 7 doesn't create duplicate numbers in contacts
diary = Diary.new
entry_1 = Entry.new('title_1', 'no.s 07812345678, 07812345678')
entry_2 = Entry.new('title_2', 'no.s 07812345678, 17812345678')
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.contacts # => ['07812345678', '17812345678']

```

## Create Examples as Unit Tests

Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

```ruby
# Diary

# 1 it returns empty lists after just being initialized
diary = Diary.new
diary.entries # => []
diary.tasks # => []
diary.contacts # => []

# 2 fails if task is an emptry string
diary = Diary.new
diary.add_task("") # => fail

# 3 Can it store tasks
diary = Diary.new
diary.add_task("task_1")
diary.add_task("task_2")
diary.tasks # => ["task_1", "task_2"]

# Entry

# 1 fails if title or contents are empty strings
entry = Entry.new("title", "") # => fails
entry = Entry.new("", "contents") # => fails
entry = Entry.new("", "") # => fails

# 2 can return title and contents
entry = Entry.new("title", "contents")
entry.title # => "title"
entry.contents # => "contents"

# 3 can return non-duplicate contact no.s
entry = Entry.new("title", "07812345678 07812345678")
entry.contacts # => ['07812345678']

# 4 does not grab other numbers
entry_1 = Entry.new("title", "07812345678 1234567891")
entry_2 = Entry.new("title", "giving my 10000000000000% call 07812345678")
entry_1.contacts => ['07812345678']
entry_2.contacts => ['07812345678']

# 5 can return sum of words
entry = Entry.new("title", "one " * 200)
entry.count_words # => 200
```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour