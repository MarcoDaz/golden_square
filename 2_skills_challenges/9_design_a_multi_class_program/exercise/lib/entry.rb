class Entry
    def initialize(title, contents)
        fail "Please enter valid title and contents" if title.length == 0 || contents.length == 0

        @title = title
        @contents = contents
        @contacts = find_unique_numbers(contents)
    end

    def title
        @title
    end

    def contents
        @contents
    end

    def contacts
        @contacts
    end

    def count_words
        @contents.split(" ").length
    end

    private

    def find_unique_numbers(contents)
        contents
            .scan(/[0-9]{11,}/)
            .select{ |num| num.length == 11 }
            .uniq
    end
end