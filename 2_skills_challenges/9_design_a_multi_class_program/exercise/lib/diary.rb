class Diary
    attr_accessor :entries, :tasks, :contacts

    def initialize
        @entries = []        
        @tasks = []        
        @contacts = []        
    end

    def add_task(task)
        fail "Please enter a valid task" if task.length == 0
        tasks << task
    end

    def add_entry(entry)
        entries << entry
        
        entry.contacts.each { |num| contacts << num unless contacts.include?(num) }
    end

    def read(title)
        output = entries.find{ |entry| entry.title == title }

        if output
            return output.contents
        else
            fail "No matching entry found"
        end
    end

    def best_entry(wpm, minutes)
        max_words = wpm * minutes
        found_entry = entries
            .sort_by { |entry| entry.count_words }
            .reverse # largest to smalles
            .find { |entry| entry.count_words <= max_words }

        if found_entry
            return found_entry
        else
            fail "No entries readable within the given time and speed"
        end
    end
end