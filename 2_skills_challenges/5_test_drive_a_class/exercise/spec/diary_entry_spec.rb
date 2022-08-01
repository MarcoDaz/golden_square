require 'diary_entry'

RSpec.describe DiaryEntry do
    it "constructs given a title and contents" do
        diary = DiaryEntry.new("MyDiary", "contents")
        expect(diary.title).to eq "MyDiary"
        expect(diary.contents).to eq "contents"
    end

    describe "#count_words" do
        it "can return the number of words in the contents" do
            diary = DiaryEntry.new("MyDiary", "words " * 200)
            words = diary.count_words
            expect(words).to eq 200
        end
    end

    describe "#reading_time" do
        context "given a wpm e.g. 200" do
            it "can return an estimate reading time as an integer (ceiling value)" do
                diary = DiaryEntry.new("MyDiary", "words " * 450)
                expect(diary.reading_time(200)).to eq 3
            end
        end

        context "given a wpm of 0" do
            it "fails" do
                diary = DiaryEntry.new("MyDiary", "try to read me")
                expect { diary.reading_time(0) }.to raise_error "Reading speed must be greater than 0"
            end
        end
    end

    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.

    describe "#reading_chunk" do
        context "given 0 for either wpm or minutes" do
            it "fails" do
                diary = DiaryEntry.new("MyDiary", "try to read me")
                expect { diary.reading_chunk(0, 10) }.to raise_error "Reading speed and minutes must be greater than 0"
            end

            it "fails" do
                diary = DiaryEntry.new("MyDiary", "try to read me")
                expect { diary.reading_chunk(10, 0) }.to raise_error "Reading speed and minutes must be greater than 0"
            end
        end

        context "given contents readble within the reading minutes" do
            it "returns the full text" do
                diary = DiaryEntry.new("MyDiary", "try to read me")
                expect(diary.reading_chunk(10, 10)).to eq "try to read me"
            end
        end

        context "given contents not readable within the reading minutes" do
            it "returns a chunk" do
                diary = DiaryEntry.new("MyDiary", "one two three")
                chunk = diary.reading_chunk(2, 1)
                expect(chunk).to eq "one two"
            end

            it "returns the next chunk next time we are asked" do
                diary = DiaryEntry.new("MyDiary", "one two three")
                chunk1 = diary.reading_chunk(2, 1)
                chunk2 = diary.reading_chunk(2, 1)
                expect(chunk2).to eq "three"
            end

            it "returns first chunk after reading whole contents" do
                diary = DiaryEntry.new("MyDiary", "one two three")
                chunk1 = diary.reading_chunk(2, 1)
                chunk2 = diary.reading_chunk(2, 1)
                chunk3 = diary.reading_chunk(2, 1) # == chunk1
                expect(chunk3).to eq "one two"
            end

            it "returns the first chunk if it finishes exactly on the end" do
                diary = DiaryEntry.new("MyDiary", "one two three four")
                chunk1 = diary.reading_chunk(2, 1) # => "one two"
                chunk2 = diary.reading_chunk(2, 1) # => "three four"
                chunk3 = diary.reading_chunk(2, 1) # => back to "one two"
                expect(chunk3).to eq "one two"
            end
        end
    end
    
end