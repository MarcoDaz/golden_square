# MyTracks Class Design Recipe

## Describe the Problem

_Put or write the user story here. Addd any clarifying notes you might have.

> As a user <br>
> So that I can keep track of my music listening <br>
> I want to add tracks I've listened to and see a list of them

## Design the Method Signature

_Include the name of the method, it's parameters, return value, and side effects.

```ruby
class MyTracks
    def initialize
        # need a list of songs to keep track
    end

    def add(track) # track is a string representing the title of a song
        # adds song to a list
    end

    def list
        # returns a list of tracks
    end
end
```

## Create Examples as Tests

_Make a list of examples of what the method will take and return.

```ruby
# 1
my_tracks = MyTracks.new
my_tracks.list # => []

# 2
my_tracks = MyTracks.new
my_tracks.add("") # => fails

# 3
my_tracks = MyTracks.new
my_tracks.add("song1")
my_tracks.add("song2")
my_tracks.list # => ["song1", "song2"]

# 4
my_tracks = MyTracks.new
my_tracks.add("song1")
my_tracks.add("song1")
my_tracks.list # => ["song1"]

```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour