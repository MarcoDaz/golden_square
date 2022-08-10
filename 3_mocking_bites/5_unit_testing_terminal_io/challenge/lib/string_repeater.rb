class StringRepeater
    def initialize(io)
        @io = io
    end

    def run
        @io.puts "Hello. I will repeat a string many times."

        @io.puts "Please enter a string."
        string = @io.gets.chomp

        fail "Invalid string!" if string.length == 0

        @io.puts "Please enter a number of repeats."
        repeats = @io.gets.chomp.to_f

        fail "Invalid repeats!" unless repeats > 0 && repeats.to_i == repeats

        @io.puts "Here is your result:"
        @io.puts string * repeats
    end
end