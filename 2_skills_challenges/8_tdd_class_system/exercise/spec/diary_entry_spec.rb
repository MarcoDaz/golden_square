require 'diary_entry'

RSpec.describe DiaryEntry do
    context "when initialized with no title or contents" do
        it "fails" do
            expect { entry = DiaryEntry.new("", "contents only") }.to raise_error "Please enter a valid title and contents"
            expect { entry = DiaryEntry.new("title only", "") }.to raise_error "Please enter a valid title and contents"
            expect { entry = DiaryEntry.new("", "") }.to raise_error "Please enter a valid title and contents"
        end  
    end

    describe "#title" do
        it "returns the title of the diary entry" do
            entry = DiaryEntry.new("title", "contents")
            expect(entry.title).to eq "title"
        end
    end

    describe "#contents" do
        it "returns the contents of the diary entry" do
            entry = DiaryEntry.new("title", "contents")
            expect(entry.contents).to eq "contents"
        end
    end

    describe "#count_words" do
        it "returns the number of words in the contents of the diary entry" do
            entry_1 = DiaryEntry.new("title", "word")
            expect(entry_1.count_words).to eq 1

            entry_2 = DiaryEntry.new("title", "word " * 200)
            expect(entry_2.count_words).to eq 200
        end
    end

    describe "#reading_time" do
        context "given a wpm less than or equal to 0" do
            it "fails" do
                entry = DiaryEntry.new("title", "contents")
                expect { entry.reading_time(0) }.to raise_error "Please enter a reading speed greater than 0"
            end
        end

        context "given a valid wpm" do
            it "returns the ceiling minutes taken to read the contents" do
                entry_1 = DiaryEntry.new("title", "one")
                expect(entry_1.reading_time(1)).to eq 1

                entry_2 = DiaryEntry.new("title", "one " * 200)
                expect(entry_2.reading_time(150)).to eq 2
            end
        end
    end

    describe "#reading_chunk" do
        context "given 0 for wpm or minutes" do
            it "fails" do
                entry = DiaryEntry.new("title", "contents")
                expect { entry.reading_chunk(10, 0) }.to raise_error "Enter a value greater than 0 for reading speed and time"
                expect { entry.reading_chunk(0, 10) }.to raise_error "Enter a value greater than 0 for reading speed and time"
                expect { entry.reading_chunk(0, 0) }.to raise_error "Enter a value greater than 0 for reading speed and time"
            end
        end

        context "given contents that can be read within the reading time" do
            it "returns the entire contents" do
                entry = DiaryEntry.new("title", "one " * 200)
                expect(entry.reading_chunk(20, 10)).to eq "one " * 200
            end
        end

        context "given contents that cannot be read within the reading time" do
            it "returns the first chunk after one method call" do
                entry = DiaryEntry.new("title", "one two three")
                chunk = entry.reading_chunk(1, 2)
                expect(chunk).to eq "one two"
            end

            it "returns the second chunk after two method calls" do
                entry = DiaryEntry.new("title", "one two three")
                chunk1 = entry.reading_chunk(1, 2)
                chunk2 = entry.reading_chunk(1, 2)
                expect(chunk1).to eq "one two"
                expect(chunk2).to eq "three"
            end

            it "returns the first chunk again after fully reading the contents" do
                entry = DiaryEntry.new("title", "one two three")
                chunk1 = entry.reading_chunk(1, 2)
                chunk2 = entry.reading_chunk(1, 2)
                chunk3 = entry.reading_chunk(1, 2)
                expect(chunk1).to eq "one two"
                expect(chunk2).to eq "three"
                expect(chunk3).to eq "one two"
            end
        end
    end

end