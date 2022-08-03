require 'diary_entry'
require 'diary'

RSpec.describe "Integration" do
    it "can return a list of all entries" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("title_1", "contents_1")
        entry_2 = DiaryEntry.new("title_2", "contents_2")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.all).to eq [entry_1, entry_2]
    end

    it "can return the total words of all entries" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("title_1", "word " * 200)
        entry_2 = DiaryEntry.new("title_2", "word " * 300)
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.count_words).to eq 500
    end

    it "returns the ceiling reading time given wpm" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("title_1", "word " * 200)
        diary.add(entry_1)
        expect(diary.reading_time(200)).to eq 1

        entry_2 = DiaryEntry.new("title_2", "word " * 300)
        diary.add(entry_2)
        expect(diary.reading_time(200)).to eq 3
    end

    describe "when finding entries given wpm and minutes" do
        context "given entries readable within reading time" do
            it "returns entry instance closes to but not over the reading time" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("title_1", "word " * 200)
                entry_2 = DiaryEntry.new("title_2", "word " * 400)
                diary.add(entry_1)
                diary.add(entry_2)

                # Given total readble words = 100 * 3 = 300 words 
                best_entry = diary.find_best_entry_for_reading_time(100, 3)

                expect(best_entry).to eq entry_1
            end
        end

        context "given entries not readable within reading time" do
            it "fails" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("title_1", "word " * 200)
                entry_2 = DiaryEntry.new("title_2", "word " * 400)

                # Given total readble words = 50 * 3 = 150 words 
                expect { diary.find_best_entry_for_reading_time(50, 3) }.to raise_error "No entry readable given the available time"
            end
        end
    end
end