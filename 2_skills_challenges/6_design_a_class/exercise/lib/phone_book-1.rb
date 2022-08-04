class PhoneBook
    def initialize
        @list = []
    end

    def extract_numbers(text)
        text.scan(/[0-9]{11,}/).each do |num|
            @list << num unless @list.include?(num) || num.length > 11
        end
    end

    def list
        return @list
    end
end